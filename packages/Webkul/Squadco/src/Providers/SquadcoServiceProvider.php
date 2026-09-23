<?php

namespace Webkul\Squadco\Providers;

use Illuminate\Support\ServiceProvider;

class SquadcoServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->registerConfig();
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        $this->loadRoutesFrom(__DIR__.'/../Routes/web.php');

        $this->loadTranslationsFrom(__DIR__.'/../Resources/lang', 'squadco');
    }

    /**
     * Register package config.
     */
    protected function registerConfig(): void
    {
        $this->mergeConfigFrom(
            dirname(__DIR__).'/Config/payment-methods.php',
            'payment_methods'
        );
    }
}
