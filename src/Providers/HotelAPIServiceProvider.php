<?php

namespace HotelAPI\Providers;

use Illuminate\Support\ServiceProvider;

class HotelApiServiceProvider extends ServiceProvider
{
    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;


    /**
     * Boot the service provider.
     */
    public function boot()
    {
        $this->publishes([
            __DIR__.'/../Config/config.php' => config_path('hotel.php'),
        ], 'config');



        $this->publishes([
            __DIR__.'/../Database/migrations/' => database_path('migrations')
        ], 'migrations');
    }


    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->mergeConfigFrom(__DIR__.'/../config/config.php', 'fidel');
    }

}
