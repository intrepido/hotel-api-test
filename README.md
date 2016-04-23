# Hotel Api
A PHP module to connect and request hotel services from Amadeus Client

##Installation

To install this package you will need:

* Laravel 5.1
* PHP 5.4 +
 
Add to your ```composer.json``` file the repository directly:

```
"repositories": [
        {
            "type": "vcs",
            "url": "https://github.com/foresttravel/hotel-api"
        }
 ]
```

Install via composer running in your terminal the command.

```
composer require foresttravel/hotel-api --prefer-source
```

Once this has finished, you will need to add the service provider to the providers array in your ```app.php``` config as follows:


``` 'HotelAPI\Providers\HotelApiServiceProvider::class' ```


Then run in your terminal:

``` php artisan vendor:publish --provider="HotelAPI\Providers\HotelApiServiceProvider" ```

###Connection
To make succefull connection you need to specify this env variables in you ```.env``` file: 

```
API_ENDPOINT_AMADEUS='*******'
API_USERNAME_AMADEUS='*******'
API_PASSWORD_AMADEUS='*******'
```

###Authentication
To use the middleware you will have to register them in ``` app/Http/Kernel.php ``` under the ``` $routeMiddleware ``` property:

``` 
protected $routeMiddleware = [
    ...
    'token-amadeus' => \HotelAPI\Middleware\AuthenticateTokenAmadeus::class
]; 

```
Then in the ``` app/Http/route.php ``` you can use it like this:

``` 
$api->group(['middleware' => 'token-amadeus'], function ($api) {
        $api->post('hotel-details', 'API\V1\HotelController@hotelDetails');
        ...
});
``` 

When the user make the first request he will be logged in the Amadeus client and he received a token, then the next step would be to make the subsequent requests, with this token.

To make authenticated requests via http you will need to set an authorization header as follows:

```
Authorization: Bearer {yourtokenhere}
```

*Note to Apache users*

Apache seems to discard the Authorization header if it is not a base64 encoded user/pass combo. So to fix this you can add the following to your apache config

```
RewriteEngine On
RewriteCond %{HTTP:Authorization} ^(.*)
RewriteRule .* - [e=HTTP_AUTHORIZATION:%1]
```

###Database
This package has some codifiers tables that it need for properly work. You need to specify with database driver you want to use for the migrations. You may specify the driver with this env variable in you ```.env``` file:

```
API_CONNECTION_DRIVER='*****'
```
Then you can make the migration:

```
php artisan migrate 
```

###Updates
To keep updated this package you can use this command:

```
composer update foresttravel/hotel-api --lock
```
