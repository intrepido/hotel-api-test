<?php

return [
    'credentials_amadeus' => [
        'name' => env('API_USERNAME_AMADEUS'),
        'password' => env('API_PASSWORD_AMADEUS')
    ],
    'host_amadeus' => [
        'url' => 'http://' . env('API_ENDPOINT_AMADEUS') . '/api/hotel-client'
    ]
];

