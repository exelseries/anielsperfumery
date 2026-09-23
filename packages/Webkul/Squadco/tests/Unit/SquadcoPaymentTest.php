<?php

use Webkul\Squadco\Payment\Squadco;

beforeEach(function () {
    $this->squadco = Mockery::mock(Squadco::class)->makePartial();
});

it('returns the correct payment method code', function () {
    expect($this->squadco->getCode())->toBe('squadco');
});

it('returns the payment method title from configuration', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('title')
        ->andReturn('SquadCo Payment');

    expect($this->squadco->getTitle())->toBe('SquadCo Payment');
});

it('returns default payment method title when config is missing', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('title')
        ->andReturn(null);

    expect($this->squadco->getTitle())->toBe(trans('squadco::app.title'));
});

it('returns the payment method description from configuration', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('description')
        ->andReturn('Pay securely using SquadCo');

    expect($this->squadco->getDescription())->toBe('Pay securely using SquadCo');
});

it('returns default payment method description when config is missing', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('description')
        ->andReturn(null);

    expect($this->squadco->getDescription())->toBe(trans('squadco::app.description'));
});

it('returns the public key from configuration', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('public_key')
        ->andReturn('pk_test_12345');

    expect($this->squadco->getPublicKey())->toBe('pk_test_12345');
});

it('returns the secret key from configuration', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('secret_key')
        ->andReturn('sk_test_67890');

    expect($this->squadco->getSecretKey())->toBe('sk_test_67890');
});

it('checks if sandbox mode is enabled', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('sandbox')
        ->andReturn(1);

    expect($this->squadco->isSandbox())->toBeTrue();
});

it('checks if sandbox mode is disabled', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('sandbox')
        ->andReturn(0);

    expect($this->squadco->isSandbox())->toBeFalse();
});

it('returns sandbox API base URL when sandbox is enabled', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('sandbox')
        ->andReturn(true);

    expect($this->squadco->getApiBaseUrl())->toBe('https://sandbox-api-d.squadco.com');
});

it('returns production API base URL when sandbox is disabled', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('sandbox')
        ->andReturn(false);

    expect($this->squadco->getApiBaseUrl())->toBe('https://api-d.squadco.com');
});

it('checks if credentials are valid', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('public_key')
        ->andReturn('pk_test_123');

    $this->squadco->shouldReceive('getConfigData')
        ->with('secret_key')
        ->andReturn('sk_test_456');

    expect($this->squadco->hasValidCredentials())->toBeTrue();
});

it('returns false if secret key is missing', function () {
    $this->squadco->shouldReceive('getConfigData')
        ->with('public_key')
        ->andReturn('pk_test_123');

    $this->squadco->shouldReceive('getConfigData')
        ->with('secret_key')
        ->andReturn('');

    expect($this->squadco->hasValidCredentials())->toBeFalse();
});

it('returns redirect URL for payment', function () {
    expect($this->squadco->getRedirectUrl())->toBe(route('squadco.redirect'));
});
