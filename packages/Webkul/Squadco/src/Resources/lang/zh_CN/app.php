<?php

return [
    'description' => 'Pay securely using Card, Bank Transfer, or USSD via SquadCo',
    'title' => 'SquadCo',

    'redirect' => [
        'click-if-not-redirected' => 'Click here to continue',
        'please-wait' => 'Please wait while we redirect you to SquadCo payment gateway...',
        'redirect-message' => 'If you are not redirected automatically, click the button below.',
        'redirecting' => 'Redirecting to SquadCo...',
        'redirecting-to-payment' => 'Redirecting to SquadCo Payment',
        'secure-payment' => 'Secure Payment Gateway',
    ],

    'response' => [
        'cart-not-found' => 'Cart not found. Please try again.',
        'hash-mismatch' => 'Payment verification failed. Invalid signature.',
        'invalid-transaction' => 'Invalid transaction. Please try again.',
        'order-creation-failed' => 'Failed to create order. Please contact support.',
        'payment-already-processed' => 'Payment already processed.',
        'payment-cancelled' => 'Payment was cancelled. You can try again.',
        'payment-failed' => 'Payment failed. Please try again.',
        'payment-success' => 'Payment completed successfully!',
        'provide-credentials' => 'Please configure SquadCo API Keys in the admin panel.',
    ],
];
