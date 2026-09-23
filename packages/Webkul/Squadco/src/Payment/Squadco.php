<?php

namespace Webkul\Squadco\Payment;

use Illuminate\Support\Facades\Storage;
use Webkul\Payment\Payment\Payment;

class Squadco extends Payment
{
    /**
     * Payment method code.
     *
     * @var string
     */
    protected $code = 'squadco';

    /**
     * Return redirect URL for SquadCo payment.
     *
     * @return string
     */
    public function getRedirectUrl()
    {
        return route('squadco.redirect');
    }

    /**
     * Check if payment method is available.
     *
     * @return bool
     */
    public function isAvailable()
    {
        return parent::isAvailable() && $this->hasValidCredentials();
    }

    /**
     * Get payment method title.
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->getConfigData('title') ?? trans('squadco::app.title');
    }

    /**
     * Get payment method description.
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->getConfigData('description') ?? trans('squadco::app.description');
    }

    /**
     * Get payment method image/logo.
     *
     * @return string|null
     */
    public function getImage()
    {
        $url = $this->getConfigData('image');

        return $url ? Storage::url($url) : bagisto_asset('images/squadco.png', 'shop');
    }

    /**
     * Get secret key from configuration.
     *
     * @return string|null
     */
    public function getSecretKey()
    {
        return $this->getConfigData('secret_key');
    }

    /**
     * Get public key from configuration.
     *
     * @return string|null
     */
    public function getPublicKey()
    {
        return $this->getConfigData('public_key');
    }

    /**
     * Check if sandbox mode is enabled.
     *
     * @return bool
     */
    public function isSandbox()
    {
        return (bool) $this->getConfigData('sandbox');
    }

    /**
     * Get SquadCo API base URL based on sandbox configuration.
     *
     * @return string
     */
    public function getApiBaseUrl()
    {
        return $this->isSandbox()
            ? 'https://sandbox-api-d.squadco.com'
            : 'https://api-d.squadco.com';
    }

    /**
     * Validate merchant credentials.
     *
     * @return bool
     */
    public function hasValidCredentials()
    {
        return ! empty($this->getSecretKey()) && ! empty($this->getPublicKey());
    }
}
