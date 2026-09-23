<?php

use Webkul\Squadco\Payment\Squadco;

return [
    'squadco' => [
        'class' => Squadco::class,
        'code' => 'squadco',
        'title' => 'SquadCo Payment',
        'description' => 'Pay securely using Card, Bank Transfer, or USSD via SquadCo',
        'image' => 'images/squadco.png',
        'active' => true,
        'sandbox' => true,
        'sort' => 5,
    ],
];
