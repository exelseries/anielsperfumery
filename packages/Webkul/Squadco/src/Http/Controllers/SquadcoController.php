<?php

namespace Webkul\Squadco\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Webkul\Checkout\Facades\Cart;
use Webkul\Checkout\Repositories\CartRepository;
use Webkul\Sales\Repositories\InvoiceRepository;
use Webkul\Sales\Repositories\OrderRepository;
use Webkul\Sales\Repositories\OrderTransactionRepository;
use Webkul\Sales\Transformers\OrderResource;
use Webkul\Shop\Http\Controllers\Controller;
use Webkul\Squadco\Payment\Squadco;

class SquadcoController extends Controller
{
    /**
     * Payment success status constant.
     */
    public const PAYMENT_SUCCESS = 'success';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        protected CartRepository $cartRepository,
        protected OrderRepository $orderRepository,
        protected OrderTransactionRepository $orderTransactionRepository,
        protected InvoiceRepository $invoiceRepository,
        protected Squadco $squadco,
    ) {}

    /**
     * Redirect to SquadCo payment gateway.
     *
     * @return RedirectResponse
     */
    public function redirect()
    {
        if (! $this->squadco->hasValidCredentials()) {
            session()->flash('error', trans('squadco::app.response.provide-credentials'));

            return redirect()->route('shop.checkout.cart.index');
        }

        $cart = Cart::getCart();

        if (! $cart) {
            session()->flash('error', trans('squadco::app.response.cart-not-found'));

            return redirect()->route('shop.checkout.cart.index');
        }

        $transactionRef = 'SQ_'.$cart->id.'_'.time();
        $amountInKobo = (int) round($cart->base_grand_total * 100);

        $payload = [
            'email' => $cart->customer_email,
            'amount' => $amountInKobo,
            'initiate_type' => 'inline',
            'currency' => $cart->cart_currency_code ?? 'NGN',
            'transaction_ref' => $transactionRef,
            'callback_url' => route('squadco.callback'),
            'pass_charge' => false,
            'metadata' => [
                'cart_id' => (string) $cart->id,
            ],
        ];

        try {
            $response = Http::withToken($this->squadco->getSecretKey())
                ->acceptJson()
                ->post($this->squadco->getApiBaseUrl().'/transaction/initiate', $payload);

            if ($response->successful()) {
                $responseData = $response->json();

                $checkoutUrl = $responseData['data']['checkout_url']
                    ?? $responseData['data']['auth_url']
                    ?? null;

                if ($checkoutUrl) {
                    return redirect()->away($checkoutUrl);
                }
            }

            Log::error('SquadCo Payment Initiation Failed', ['response' => $response->body()]);
            session()->flash('error', trans('squadco::app.response.payment-failed'));

            return redirect()->route('shop.checkout.cart.index');
        } catch (\Exception $e) {
            report($e);
            session()->flash('error', trans('squadco::app.response.payment-failed'));

            return redirect()->route('shop.checkout.cart.index');
        }
    }

    /**
     * Handle payment callback from SquadCo.
     *
     * @return RedirectResponse
     */
    public function callback()
    {
        $transactionRef = request('reference') ?? request('transaction_ref');

        if (! $transactionRef) {
            session()->flash('error', trans('squadco::app.response.invalid-transaction'));

            return redirect()->route('shop.checkout.cart.index');
        }

        try {
            $response = Http::withToken($this->squadco->getSecretKey())
                ->acceptJson()
                ->get($this->squadco->getApiBaseUrl().'/transaction/verify/'.$transactionRef);

            if (! $response->successful()) {
                session()->flash('error', trans('squadco::app.response.payment-failed'));

                return redirect()->route('shop.checkout.cart.index');
            }

            $responseData = $response->json();
            $data = $responseData['data'] ?? [];
            $status = strtolower($data['transaction_status'] ?? '');

            if ($status !== 'success') {
                session()->flash('error', trans('squadco::app.response.payment-failed'));

                return redirect()->route('shop.checkout.cart.index');
            }

            $cartId = $data['meta']['cart_id'] ?? null;

            if (! $cartId && str_contains($transactionRef, 'SQ_')) {
                $parts = explode('_', $transactionRef);
                $cartId = $parts[1] ?? null;
            }

            if (! $cartId) {
                session()->flash('error', trans('squadco::app.response.invalid-transaction'));

                return redirect()->route('shop.checkout.cart.index');
            }

            $cart = $this->cartRepository->find($cartId);

            if (! $cart || ! $cart->is_active) {
                session()->flash('error', trans('squadco::app.response.cart-not-found'));

                return redirect()->route('shop.checkout.cart.index');
            }

            Cart::setCart($cart);
            Cart::collectTotals();

            $orderData = (new OrderResource($cart))->jsonSerialize();

            $orderData['payment']['additional'] = [
                'squadco_ref' => $transactionRef,
                'squadco_status' => $status,
            ];

            $order = $this->orderRepository->create($orderData);
            $this->orderRepository->update(['status' => 'processing'], $order->id);

            if ($order->canInvoice()) {
                $invoice = $this->invoiceRepository->create($this->prepareInvoiceData($order));

                $this->orderTransactionRepository->create([
                    'transaction_id' => $transactionRef,
                    'status' => self::PAYMENT_SUCCESS,
                    'type' => $order->payment->method,
                    'payment_method' => $order->payment->method,
                    'order_id' => $order->id,
                    'invoice_id' => $invoice->id,
                    'amount' => $order->base_grand_total,
                    'data' => json_encode($data),
                ]);
            }

            Cart::deActivateCart();
            session()->flash('order_id', $order->id);
            session()->flash('success', trans('squadco::app.response.payment-success'));

            return redirect()->route('shop.checkout.onepage.success');
        } catch (\Exception $e) {
            report($e);
            session()->flash('error', trans('squadco::app.response.order-creation-failed'));

            return redirect()->route('shop.checkout.cart.index');
        }
    }

    /**
     * Handle webhook from SquadCo.
     *
     * @return Response
     */
    public function webhook()
    {
        $signature = request()->header('x-squad-encrypted-body');
        $rawContent = request()->getContent();

        if ($signature && $this->squadco->getSecretKey()) {
            $computedSignature = strtoupper(hash_hmac('sha512', $rawContent, $this->squadco->getSecretKey()));

            if (! hash_equals($computedSignature, strtoupper($signature))) {
                Log::warning('SquadCo Webhook signature verification failed');

                return response()->json(['status' => false, 'message' => 'Invalid signature'], 400);
            }
        }

        $payload = request()->all();
        $event = $payload['Event'] ?? $payload['event'] ?? '';
        $transactionRef = $payload['TransactionRef'] ?? $payload['Body']['transaction_ref'] ?? null;

        Log::info('SquadCo Webhook Received', ['event' => $event, 'ref' => $transactionRef]);

        return response()->json(['status' => true, 'message' => 'Webhook processed']);
    }

    /**
     * Prepare invoice data.
     *
     * @param  object  $order
     * @return array
     */
    protected function prepareInvoiceData($order)
    {
        $invoiceData = ['order_id' => $order->id];

        foreach ($order->items as $item) {
            $invoiceData['invoice']['items'][$item->id] = $item->qty_to_invoice;
        }

        return $invoiceData;
    }
}
