<?php

namespace HotelAPI\Middleware;

use Closure;

class AuthenticateTokenAmadeus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */


    /**
     * --OJO-- el hecho de guardar el token en el navegador solo ayuda a no tener que loguearme con cada peticion en el Client de Amadeus.
     * Pero de todas formas desde el navegador aunque se ponga lo que se ponga en el token siempre obtendra una respuesta.
     */

    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');
       // return $this->ping($token);

        if (!$this->ping($token)) {
            $res = $this->login();
            $request->headers->set('Authorization', 'Bearer '.$res['token']);
        }

        return $next($request);
    }

    /**
     * Verifica si el token esta expirado o es incorrecto
     */
    public function ping($token){
        if ($token) {
            $client = new \GuzzleHttp\Client(['headers' => ['Authorization' => $token]]);
            try {
                $client->request('GET', config('hotel.host_amadeus.url').'/ping');
            } catch (\GuzzleHttp\Exception\ClientException $e) {
                //echo 'Caught response: ' . $e->getResponse()->getStatusCode();
                //return ($error === 'token_invalid' || $error === 'token_expired' || $error === 'token_not_provided') ? false : true;
                return false;
            }
            return true;
        }
        return false;
    }

    /**
     * Se autentica en el cliente de amadeus y me devuelve el token
     */
    public function login(){
        $client = new \GuzzleHttp\Client();
        $token = $client->request('POST', config('hotel.host_amadeus.url').'/authenticate', [
            'json' => config('hotel.credentials_amadeus')
        ]);
        return json_decode($token->getBody()->getContents(), true);
    }

}
