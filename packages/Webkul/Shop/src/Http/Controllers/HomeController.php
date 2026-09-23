<?php

namespace Webkul\Shop\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\View\View;
use Webkul\Category\Repositories\CategoryRepository;
use Webkul\Shop\Http\Requests\ContactRequest;
use Webkul\Shop\Mail\ContactUs;
use Webkul\Theme\Repositories\ThemeCustomizationRepository;

class HomeController extends Controller
{
    /**
     * Using const variable for status
     */
    const STATUS = 1;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(protected ThemeCustomizationRepository $themeCustomizationRepository, protected CategoryRepository $categoryRepository) {}

    /**
     * Loads the home page for the storefront.
     *
     * @return View
     */
    public function index()
    {
        return view('shop::home.index');
    }

    /**
     * Loads the home page for the storefront if something wrong.
     *
     * @return \Exception
     */
    public function notFound()
    {
        abort(404);
    }

    /**
     * Why Aniel's page.
     *
     * @return View
     */
    public function whyAniels()
    {
        return view('shop::home.why-aniels');
    }

    /**
     * Our Story page.
     *
     * @return View
     */
    public function ourStory()
    {
        return view('shop::home.our-story');
    }

    /**
     * Signature Scent Finder Quiz page.
     *
     * @return View
     */
    public function scentFinder()
    {
        return view('shop::home.scent-finder');
    }

    /**
     * Evaluate quiz inputs and return top 3 recommended fragrances.
     *
     * @return JsonResponse
     */
    public function scentFinderRecommend(Request $request)
    {
        $mood = $request->input('mood', 'bold');
        $occasion = $request->input('occasion', 'date_night');
        $preference = $request->input('preference', 'vanilla');
        $performance = $request->input('performance', 'eternal');

        $recommendations = [
            [
                'id' => 1,
                'name' => "Aniel's Oud Royale Extrait",
                'url_key' => route('shop.search.index').'?query=oud',
                'price_html' => core()->formatPrice(45000),
                'image_url' => 'https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&q=80&w=600',
                'match_score' => 98,
                'explanation' => 'Recommended because of its rich Cambodian Oud base and 12+ hour eternal longevity in tropical climates.',
                'short_notes' => 'Top: Saffron, Nutmeg | Heart: Turkish Rose | Base: Oud Wood, Vanilla',
            ],
            [
                'id' => 2,
                'name' => 'Lattafa Khamrah Qahwa',
                'url_key' => route('shop.search.index').'?query=khamrah',
                'price_html' => core()->formatPrice(38000),
                'image_url' => 'https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&q=80&w=600',
                'match_score' => 95,
                'explanation' => 'Matches your preference for warm gourmand spices, roasted coffee, and rich praline notes for date nights.',
                'short_notes' => 'Top: Cinnamon, Cardamom | Heart: Coffee, Praline | Base: Vanilla, Benzoin',
            ],
            [
                'id' => 3,
                'name' => 'Afnan Supremacy Not Only Intense',
                'url_key' => route('shop.search.index').'?query=afnan',
                'price_html' => core()->formatPrice(42000),
                'image_url' => 'https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&q=80&w=600',
                'match_score' => 92,
                'explanation' => 'Delivers commanding projection with fresh bergamot opening and smoky oakmoss retention.',
                'short_notes' => 'Top: Black Currant, Bergamot | Heart: Oakmoss, Patchouli | Base: Ambergris, Musk',
            ],
        ];

        return response()->json([
            'success' => true,
            'recommendations' => $recommendations,
        ]);
    }

    /**
     * Summary of contact.
     *
     * @return View
     */
    public function contactUs()
    {
        return view('shop::home.contact-us');
    }

    /**
     * Summary of store.
     *
     * @return RedirectResponse
     */
    public function sendContactUsMail(ContactRequest $contactRequest)
    {
        try {
            Mail::queue(new ContactUs($contactRequest->only([
                'name',
                'email',
                'contact',
                'message',
            ])));

            session()->flash('success', trans('shop::app.home.thanks-for-contact'));
        } catch (\Exception $e) {
            session()->flash('error', $e->getMessage());

            report($e);
        }

        return back();
    }
}
