<?php

namespace HotelAPI\Services;

use HotelAPI\Services\Transformers\HotelDescriptionTransformer;
use HotelAPI\Services\Transformers\HotelMultiSingleAvailabilityTransformer;
use HotelAPI\Services\Transformers\RoomMultiSingleAvailabilityTransformer;
use Illuminate\Http\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use League\Fractal\Resource\Item;
use League\Fractal\Serializer\ArraySerializer;


class HotelClient
{
    public function __construct(Request $request, Manager $fractalManager){
        $this->client = new \GuzzleHttp\Client(['headers' => ['Authorization' => $request->header('Authorization')]]);
        $fractalManager->setSerializer(new ArraySerializer());
        $this->fractalManager = $fractalManager;
    }


    /******************************************************** */
    /********************* Basic Search ***********************/
    /******************************************************** */

    public function basicSearch(Request $request)
    {
        //Here we must  format and validate the datas before send them


        //If it has more indicators then add to the request the session of Amadeus
        $amadeus_session = null;
        if(isset($request['more_indicators']) && isset($request['session_amadeus'])){
            $request['session_id'] = $request['session_amadeus'];
        }

        //Send request (Parameters)
        $res = $this->client->request('POST', config('hotel.host_amadeus.url').'/multi-single-availability', [
                'json' => $request->all()]
        );
        $content = $res->getBody()->getContents();

        if((!isset(json_decode($content, true)['data']['HotelStays'])) ||
            (isset(json_decode($content, true)['data']['HotelStays']['attr']) && sizeof(json_decode($content, true)['data']['HotelStays']) == 1) ||
            (isset(json_decode($content, true)['data']['HotelStays']['HotelStay']['attr']) && !isset(json_decode($content, true)['data']['HotelStays']['HotelStay']['BasicPropertyInfo']))){ //Not match results
            $hotels = 'Not match results';
        }else{
            $hotelsUnformatted = json_decode($content, true)['data']['HotelStays']['HotelStay'];
            $roomsUnformatted = json_decode($content, true)['data']['RoomStays']['RoomStay'];
            $moreIndicators = isset(json_decode($content, true)['data']['RoomStays']['attr']['MoreIndicator']) ? json_decode($content, true)['data']['RoomStays']['attr']['MoreIndicator'] : ''; //Paginate
            $currencyConversion = isset(json_decode($content, true)['data']['CurrencyConversions']['CurrencyConversion']) ? json_decode($content, true)['data']['CurrencyConversions']['CurrencyConversion'] : null; //Currency convertion

            //Receive hotels data and format them
            !isset($hotelsUnformatted[0]) ? $hotelsUnformatted = [$hotelsUnformatted] : null;
            $hotelMultiSingleAvailabilityItem = new Collection($hotelsUnformatted, new HotelMultiSingleAvailabilityTransformer());
            $hotels = $this->fractalManager->createData($hotelMultiSingleAvailabilityItem)->toArray();

            //Add currency conversion if it exist
            isset($currencyConversion) ? $hotels = $hotels + array('currency_conversion' => array('rate_conversion' => (float)$currencyConversion['attr']['RateConversion'],
                    'source_currency_code' => $currencyConversion['attr']['SourceCurrencyCode'],
                    'requested_currency_code' => $currencyConversion['attr']['RequestedCurrencyCode'])) : null;

            //Add more indicators to the hotel list if it exist
            if($moreIndicators != ''){
                $hotels = $hotels + array('more_indicators' => $moreIndicators);
                //Save Amadeus session if has more indicators
                $hotels = $hotels + array('session_amadeus' => json_decode($content, true)['headers']['Session']['SessionId']);
            }

            //Save Amadeus session if it has been requested the specific hotel information to begin the booking from 'hotel-details' view.
            if($request['stateful']){
                $hotels = $hotels + array('session_amadeus_stateful' => json_decode($content, true)['headers']['Session']['SessionId']);
            }

            //Receive rooms data and format them
            !isset($roomsUnformatted[0]) ? $roomsUnformatted = [$roomsUnformatted] : null;
            $roomMultiSingleAvailabilityItem = new Collection($roomsUnformatted, new RoomMultiSingleAvailabilityTransformer());
            $rooms = $this->fractalManager->createData($roomMultiSingleAvailabilityItem)->toArray();

            //Assign rooms and 'rooms_average_daily_lower_price' to hotels
            $hotels = $this->assignRoomsToHotels($hotels, $rooms);

            //Set filters
            $hotels = $this->setFilters($hotels);
        }
        //return response()->json($hotels)->header('Authorization', $res->getHeaders()['Authorization']);
        return $hotels;
    }

    public function assignRoomsToHotels($hotels, $rooms)
    {
        foreach ($hotels['data'] as &$hotel) {
            if(is_array($hotel['rooms'])){
                $roomsAverageDailyLowerPrice = 0;
                $roomCurrency = '';
                $roomArray = $hotel['rooms'];
                $hotel['rooms'] = array();
                foreach ($roomArray as $key => $roomKey) {
                    //Find the rooms average daily lower price
                    $roomsAverageDailyLowerPrice == 0 ? $roomsAverageDailyLowerPrice = $rooms['data'][$roomKey]['room_average_daily_rate']['amount'] : null;
                    empty($roomCurrency) ? $roomCurrency = $rooms['data'][$roomKey]['room_average_daily_rate']['currency_code'] : null;
                    if ($roomsAverageDailyLowerPrice > $rooms['data'][$roomKey]['room_average_daily_rate']['amount']) {
                        $roomsAverageDailyLowerPrice = $rooms['data'][$roomKey]['room_average_daily_rate']['amount'];
                    }
                    //Add dollar conversion to the room average daily price
                    $rooms['data'][$roomKey]['room_average_daily_rate']['dollar_conversion'] = (isset($hotels['currency_conversion']) && ($roomCurrency != 'USD')) ? ceil($rooms['data'][$roomKey]['room_average_daily_rate']['amount'] * $hotels['currency_conversion']['rate_conversion']) : $rooms['data'][$roomKey]['room_average_daily_rate']['amount'];
                    //Add rooms to hotel
                    array_push($hotel['rooms'], $rooms['data'][$roomKey]);
                }
                $hotel['rooms_average_daily_lower_rate'] = $hotel['rooms_average_daily_lower_rate'] + array('amount' => ceil($roomsAverageDailyLowerPrice)); //Room average daily lower prices
                $hotel['rooms_average_daily_lower_rate'] = $hotel['rooms_average_daily_lower_rate'] + array('dollar_conversion' => (isset($hotels['currency_conversion']) && ($roomCurrency != 'USD')) ? ceil($hotel['rooms_average_daily_lower_rate']['amount'] * $hotels['currency_conversion']['rate_conversion']) : $hotel['rooms_average_daily_lower_rate']['amount']); //Room average daily lower prices conversion to USD
                $hotel['rooms_average_daily_lower_rate'] = $hotel['rooms_average_daily_lower_rate'] + array('currency_code' => $roomCurrency); //Currency rooms
            }
        }
        return $hotels;
    }

    public function setFilters($hotels)
    {
        $hotels = array_add($hotels, 'filters', array());
        $amenitiesTypeTotal = array('amenities' => array());
        $chainsTotal = array('chains' => array());
        $biggerLowerPrice = array('prices' => array());
        $lower_price = 0;
        $bigger_price = 0;
        foreach ($hotels['data'] as $key => $hotel) {
            //Amenities
            if(is_array($hotel['amenities'])){
                foreach ($hotel['amenities'] as $amenity) {
                    array_key_exists($amenity, $amenitiesTypeTotal['amenities']) ? $amenitiesTypeTotal['amenities'][$amenity]++ : $amenitiesTypeTotal['amenities'] = $amenitiesTypeTotal['amenities'] + array($amenity => 1);
                }
            }
            //Hotel Chains
            if($hotel['chain_name'] != ''){
                array_key_exists($hotel['chain_name'], $chainsTotal['chains']) ? $chainsTotal['chains'][$hotel['chain_name']]++ : $chainsTotal['chains'] = $chainsTotal['chains'] + array($hotel['chain_name'] => 1);
            }
            //Bigger and Lower Price
            if(isset($hotel['rooms_average_daily_lower_rate']['dollar_conversion'])){
                if($hotel['rooms_average_daily_lower_rate']['dollar_conversion'] > $bigger_price){
                    $bigger_price = $hotel['rooms_average_daily_lower_rate']['dollar_conversion'];
                }
                $lower_price == 0 ? $lower_price = $hotel['rooms_average_daily_lower_rate']['dollar_conversion'] : null;
                if($hotel['rooms_average_daily_lower_rate']['dollar_conversion'] < $lower_price){
                    $lower_price = $hotel['rooms_average_daily_lower_rate']['dollar_conversion'];
                }
            }
        }
        $biggerLowerPrice['prices'] = $biggerLowerPrice['prices'] + array('bigger_price' => $bigger_price);
        $biggerLowerPrice['prices'] = $biggerLowerPrice['prices'] + array('lower_price' => $lower_price);
        $hotels['filters'] = $hotels['filters'] + $biggerLowerPrice;
        $hotels['filters'] = $hotels['filters'] + $amenitiesTypeTotal;
        $hotels['filters'] = $hotels['filters'] + $chainsTotal;

        return $hotels;
    }


    /************************************************************* */
    /********************* Hotel Details ***************************/
    /************************************************************* */

    public function hotelDetails(Request $request)
    {
        //Here we must  format and validate the datas before send them

        //Send request (Parameters)
        $res = $this->client->request('POST', config('hotel.host_amadeus.url').'/descriptive-info', [
                'json' => $request->all()]
        );
        $content = $res->getBody()->getContents();

        if((!isset(json_decode($content, true)['data']['HotelDescriptiveContents']))){ //Not match results
            $hotelDescription = 'Not match results';
        }else{
            $hotelDescriptionUnformatted = json_decode($content, true)['data']['HotelDescriptiveContents']['HotelDescriptiveContent'];
            $hotelMultiSingleAvailabilityItem = new Item($hotelDescriptionUnformatted, new HotelDescriptionTransformer());
            $hotelDescription = $this->fractalManager->createData($hotelMultiSingleAvailabilityItem)->toArray();
        }

        return $hotelDescription;
    }


    /************************************************************* */
    /********************* Room Details ****************************/
    /************************************************************* */

    public function roomDetails(Request $request)
    {
        //Here we must  format and validate the datas before send them

        //Send request (Parameters)
        $res = $this->client->request('POST', config('hotel.host_amadeus.url').'/enhanced-pricing', [
                'json' => $request->all()]
        );
        $content = $res->getBody()->getContents();

        if((!isset(json_decode($content, true)['data']['HotelStays'])) ||
            (isset(json_decode($content, true)['data']['HotelStays']['attr']) && sizeof(json_decode($content, true)['data']['HotelStays']) == 1) ||
            (isset(json_decode($content, true)['data']['HotelStays']['HotelStay']['attr']) && !isset(json_decode($content, true)['data']['HotelStays']['HotelStay']['BasicPropertyInfo']))){ //Not match results
            $hotels = 'Not match results';
        }else{
            $hotelsUnformatted = json_decode($content, true)['data']['HotelStays']['HotelStay'];
            $roomsUnformatted = json_decode($content, true)['data']['RoomStays']['RoomStay'];
            $moreIndicators = isset(json_decode($content, true)['data']['RoomStays']['attr']['MoreIndicator']) ? json_decode($content, true)['data']['RoomStays']['attr']['MoreIndicator'] : ''; //Paginate
            $currencyConversion = isset(json_decode($content, true)['data']['CurrencyConversions']['CurrencyConversion']) ? json_decode($content, true)['data']['CurrencyConversions']['CurrencyConversion'] : null; //Currency convertion

            //Receive hotels data and format them
            !isset($hotelsUnformatted[0]) ? $hotelsUnformatted = [$hotelsUnformatted] : null;
            $hotelMultiSingleAvailabilityItem = new Collection($hotelsUnformatted, new HotelMultiSingleAvailabilityTransformer());
            $hotels = $this->fractalManager->createData($hotelMultiSingleAvailabilityItem)->toArray();

            //Add currency conversion if it exist
            isset($currencyConversion) ? $hotels = $hotels + array('currency_conversion' => array('rate_conversion' => (float)$currencyConversion['attr']['RateConversion'],
                    'source_currency_code' => $currencyConversion['attr']['SourceCurrencyCode'],
                    'requested_currency_code' => $currencyConversion['attr']['RequestedCurrencyCode'])) : null;

            //Add more indicators to the hotel list if it exist
            if($moreIndicators != ''){
                $hotels = $hotels + array('more_indicators' => $moreIndicators);
                //Save Amadeus session if has more indicators
                $hotels = $hotels + array('session_amadeus' => json_decode($content, true)['headers']['Session']['SessionId']);
            }

            //Save Amadeus session if it has been requested the specific hotel information to begin the booking from 'hotel-details' view.
            if($request['stateful']){
                $hotels = $hotels + array('session_amadeus_stateful' => json_decode($content, true)['headers']['Session']['SessionId']);
            }

            //Receive rooms data and format them
            !isset($roomsUnformatted[0]) ? $roomsUnformatted = [$roomsUnformatted] : null;
            $roomMultiSingleAvailabilityItem = new Collection($roomsUnformatted, new RoomMultiSingleAvailabilityTransformer());
            $rooms = $this->fractalManager->createData($roomMultiSingleAvailabilityItem)->toArray();

            //Assign rooms and 'rooms_average_daily_lower_price' to hotels
            $hotels = $this->assignRoomsToHotels($hotels, $rooms);

            //Set filters
            $hotels = $this->setFilters($hotels);
        }
        //return response()->json($hotels)->header('Authorization', $res->getHeaders()['Authorization']);
        return $hotels;
    }


    /************************************************************* */
    /********************* Information Booking *********************/
    /************************************************************* */

    public function informationBooking(Request $request)
    {
        //Here we must  format and validate the datas before send them

        //Send request (Parameters)
        $res = $this->client->request('POST', config('hotel.host_amadeus.url').'/descriptive-info', [
                'json' => $request->all()]
        );
        $content = $res->getBody()->getContents();

        if((!isset(json_decode($content, true)['data']['HotelDescriptiveContents']))){ //Not match results
            $hotelDescription = 'Not match results';
        }else{
            $hotelDescriptionUnformatted = json_decode($content, true)['data']['HotelDescriptiveContents']['HotelDescriptiveContent'];
            $hotelMultiSingleAvailabilityItem = new Item($hotelDescriptionUnformatted, new HotelDescriptionTransformer());
            $hotelDescription = $this->fractalManager->createData($hotelMultiSingleAvailabilityItem)->toArray();
        }

        return $hotelDescription;
    }

}
