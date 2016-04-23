# Hotel Api
A PHP module to connect and request hotel services from Amadeus Client

##Installation


To install this package you will need:

Laravel 5
PHP 5.4 +
Install via composer - edit your ```composer.json``` to require the package.

```
"require": {
    "foresttravel/hotel-api": "0.0.2"
}
```
Then run ```composer update``` in your terminal to pull it in.

Once this has finished, you will need to add the service provider to the providers array in your ```app.php``` config as follows:

``` 'HotelAPI\Providers\HotelApiServiceProvider::class' ```


Then run in your terminal:

``` php artisan vendor:publish --provider="HotelAPI\Providers\HotelApiServiceProvider" ```

###Authentication
To use the middleware you will have to register them in ``` app/Http/Kernel.php ``` under the ``` $routeMiddleware ``` property:

``` 
protected $routeMiddleware = [
    ...
    'token-amadeus' => \HotelAPI\Middleware\AuthenticateTokenAmadeus::class
]; 

```
