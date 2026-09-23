<?php

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Support\Facades\Route;
use Webkul\Squadco\Http\Controllers\SquadcoController;

Route::group(['middleware' => ['web']], function () {
    Route::controller(SquadcoController::class)
        ->prefix('squadco')
        ->group(function () {
            Route::get('redirect', 'redirect')->name('squadco.redirect');

            Route::get('callback', 'callback')->name('squadco.callback');

            Route::post('webhook', 'webhook')
                ->withoutMiddleware(VerifyCsrfToken::class)
                ->name('squadco.webhook');
        });
});
