<?php

namespace HotelAPI\Services\Transformers;

use HotelAPI\Services\Models\Amenity;
use HotelAPI\Services\Models\Country;
use HotelAPI\Services\Models\PhoneTechType;
use League\Fractal\TransformerAbstract;


class HotelMultiSingleAvailabilityTransformer extends TransformerAbstract
{
    public function transform(Array $multiSingleAvailabilityItem)
    {
        //Address
        $address = '';
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['Address'])) {
            $addressLineComplete = '';
            if(isset($multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['AddressLine'])){
                $addressLineTemp = $multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['AddressLine'];
                !isset($addressLineTemp[0]) ? $addressLineTemp = [$addressLineTemp] : null;
                foreach ($addressLineTemp as $key => $addressLine) {
                    $addressLineComplete = $addressLineComplete . $addressLine['value'];
                    if (isset($addressLineTemp[$key + 1])) {
                        $addressLineComplete = $addressLineComplete . ' ';
                    }
                }
            }
            $address = array('address_line' => ucwords(strtolower($addressLineComplete)),
                             'city_name' => ucwords(strtolower($multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['CityName']['value'])),
                             'postal_code' => isset($multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['PostalCode']['value']) ? $multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['PostalCode']['value']: '',
                             'country_name' => Country::connection(env('API_CONNECTION_DRIVER'))->where('country_code', $multiSingleAvailabilityItem['BasicPropertyInfo']['Address']['CountryName']['attr']['Code'])->first()["country_name"]);
        }

        //Contact Number
        $contactNumbers = [];
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['ContactNumbers'])) {
            $contactNumbersTemp = $multiSingleAvailabilityItem['BasicPropertyInfo']['ContactNumbers']['ContactNumber'];
            !isset($contactNumbersTemp[0]) ? $contactNumbersTemp = [$contactNumbersTemp] : null;
            foreach ($contactNumbersTemp as $key => $contactNumber) {
                $contactNumbers = $contactNumbers + array(PhoneTechType::connection(env('API_CONNECTION_DRIVER'))->where('phone_tech_code', $contactNumber['attr']['PhoneTechType'])->first()["phone_tech_name"] => str_replace('+','',str_replace(' ','-',str_replace('/','-',trim($contactNumber['attr']['PhoneNumber'])))));
            }
        }

        //Awards
        $awards = [];
        $awards_average = 0;
        $awardsTemp = null;
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['Award'])) {
            $awardsTemp = $multiSingleAvailabilityItem['BasicPropertyInfo']['Award'];
            !isset($awardsTemp[0]) ? $awardsTemp = [$awardsTemp] : null;
            foreach ($awardsTemp as $key => $award) {
                $rating = 0;
                $ratingOHG = 0;
                if($award['attr']['Provider'] == 'OHG'){
                    if($award['attr']['Rating'] == 'D'){
                        $rating = "Deluxe Class";
                        $ratingOHG = 5;
                    }
                    if($award['attr']['Rating'] == 'F'){
                        $rating = "First Class";
                        $ratingOHG = 4;
                    }
                    if($award['attr']['Rating'] == 'T'){
                        $rating = "Tourist Class";
                        $ratingOHG = 3;
                    }
                }else{
                    $rating = (int)$award['attr']['Rating'];
                }
                $awards = $awards + array($award['attr']['Provider'] => $rating);
                $awards_average = $awards_average + ($ratingOHG ? $ratingOHG : $rating);
            }
        }
        $awards = $awardsTemp ? $awards + array('awards_average' => ceil($awards_average/sizeof($awardsTemp))) : $awards + array('awards_average' => 0);

        //Short Description
        //Long Description
        //URL Image
        $shortDescription = '';
        $longDescription = '';
        $urlImage= '';
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['VendorMessages'])) {
            $paragraphsTemp = $multiSingleAvailabilityItem['BasicPropertyInfo']['VendorMessages']['VendorMessage']['SubSection']['Paragraph'];
            !isset($paragraphsTemp[0]) ? $paragraphsTemp = [$paragraphsTemp] : null;
            foreach ($paragraphsTemp as $key => $paragraph) {
                if(isset($paragraph['attr']['Name'])){
                    if($paragraph['attr']['Name'] == 'ShortTextDescription'){
                        $textTemp = $paragraph['Text'];
                        !isset($textTemp[0]) ? $textTemp = [$textTemp] : null;
                        foreach ($textTemp as $key2 => $text) {
                            $shortDescription .= $text['value'];
                        }
                    }
                    if($paragraph['attr']['Name'] == 'LongTextDescription'){
                        $textTemp = $paragraph['Text'];
                        !isset($textTemp[0]) ? $textTemp = [$textTemp] : null;
                        foreach ($textTemp as $key2 => $text) {
                            $longDescription .= $text['value'];
                        }
                    }
                    if(0 === strpos($paragraph['attr']['Name'], 'Image-')){
                        $urlImage = $paragraph['URL']['value'];
                    }
                }
            }
        }

        //Position
        $position = '';
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['Position'])) {
            $position = array('latitude' => $multiSingleAvailabilityItem['BasicPropertyInfo']['Position']['attr']['Latitude'],
                              'longitude' => $multiSingleAvailabilityItem['BasicPropertyInfo']['Position']['attr']['Longitude']);
        }

        //Amenities
        $amenities = [];
        if (isset($multiSingleAvailabilityItem['BasicPropertyInfo']['HotelAmenity'])) {
            $amenitiesTemp = $multiSingleAvailabilityItem['BasicPropertyInfo']['HotelAmenity'];
            !isset($amenitiesTemp[0]) ? $amenitiesTemp = [$amenitiesTemp] : null;
            foreach ($amenitiesTemp as $key => $amenity) {
                $amenityName = Amenity::connection(env('API_CONNECTION_DRIVER'))->where('amenity_code', $amenity['attr']['Code'])->first()["amenity_name"];
                !in_array($amenityName, $amenities) ? array_push($amenities, $amenityName) : null;
            }
        }

        //Rooms Array
        $rooms = '';
        if (isset($multiSingleAvailabilityItem['attr']['RoomStayRPH'])) {
            $rooms = explode(' ', $multiSingleAvailabilityItem['attr']['RoomStayRPH']);
        }


        return [
            'hotel_code' => isset($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['HotelCode']) ? $multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['HotelCode'] : '',
            'hotel_name' => isset($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['HotelName']) ? ucwords(strtolower($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['HotelName'])) : '',
            'chain_code' => isset($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['ChainCode']) ? $multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['ChainCode'] : '',
            'chain_name' => isset($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['ChainName']) ? ucwords(strtolower($multiSingleAvailabilityItem['BasicPropertyInfo']['attr']['ChainName'])) : '',
            'address' => $address,
            'contact_numbers' => $contactNumbers,
            'awards' => $awards,
            'short_description' => $shortDescription,
            'long_description' => $longDescription,
            'url_image' => $urlImage,
            'position' => $position,
            'amenities' => $amenities,
            'rooms_average_daily_lower_rate' => [],
            'rooms' => $rooms,
        ];
    }

}

