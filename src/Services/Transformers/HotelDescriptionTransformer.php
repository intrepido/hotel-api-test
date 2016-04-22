<?php

namespace HotelAPI\Services\Transformers;

use HotelAPI\Services\Models\Amenity;
use HotelAPI\Services\Models\BusinessService;
use HotelAPI\Services\Models\Country;
use HotelAPI\Services\Models\DisabilityFeature;
use HotelAPI\Services\Models\GuestRoomInfo;
use HotelAPI\Services\Models\LocationCategory;
use HotelAPI\Services\Models\PaymentType;
use HotelAPI\Services\Models\PhoneTechType;
use HotelAPI\Services\Models\RecreationService;
use HotelAPI\Services\Models\RoomAmenity;
use HotelAPI\Services\Models\SecurityFeature;
use HotelAPI\Services\Models\SegmentCategory;
use League\Fractal\TransformerAbstract;


class HotelDescriptionTransformer extends TransformerAbstract
{
    public function transform(Array $descriptionItem)
    {
        //Hotel Description
        $hotelDescription = '';
        if (isset($descriptionItem['HotelInfo']['Descriptions']['MultimediaDescriptions']['MultimediaDescription'])) {
            $multimedias = $descriptionItem['HotelInfo']['Descriptions']['MultimediaDescriptions']['MultimediaDescription'];
            foreach ($multimedias as $key => $multimedia) {
                if (isset($multimedia['attr']['InfoCode']) && isset($multimedia['attr']['AdditionalDetailCode']) && isset($multimedia['TextItems'])) {
                    if (($multimedia['attr']['InfoCode'] == '17') && ($multimedia['attr']['AdditionalDetailCode'] == '2') ||
                        ($multimedia['attr']['InfoCode'] == '1') && ($multimedia['attr']['AdditionalDetailCode'] == '2')
                    ) {
                        !isset($multimedia['TextItems']['TextItem']['Description'][0]) ? $multimedia['TextItems']['TextItem']['Description'] = [$multimedia['TextItems']['TextItem']['Description']] : null;
                        foreach ($multimedia['TextItems']['TextItem']['Description'] as $description) {
                            isset($description['value']) ? $hotelDescription .= $description['value'] : null;
                        }
                    }
                }
            }
        }

        //Location Category
        $locationCategory = [];
        if (isset($descriptionItem['HotelInfo']['CategoryCodes']['LocationCategory'])) {
            $locationCategoryTemp = $descriptionItem['HotelInfo']['CategoryCodes']['LocationCategory'];
            !isset($locationCategoryTemp[0]) ? $locationCategoryTemp = [$locationCategoryTemp] : null;
            foreach ($locationCategoryTemp as $key => $locationCategoryCode) {
                array_push($locationCategory, LocationCategory::where('location_category_code', $locationCategoryCode['attr']['Code'])->first()['location_category_name']);
            }
        }

        //Segment Category
        $segmentCategory = [];
        if (isset($descriptionItem['HotelInfo']['CategoryCodes']['SegmentCategory'])) {
            $segmentCategoryTemp = $descriptionItem['HotelInfo']['CategoryCodes']['SegmentCategory']['attr']['Code'];
            $segmentCategory = SegmentCategory::where('segment_category_code', $segmentCategoryTemp)->first()["segment_category_name"];
        }

        //Contact Infos
        $contactInfos = [];
        if (isset($descriptionItem['ContactInfos']['ContactInfo'])) {
            $descriptionTemp = $descriptionItem['ContactInfos']['ContactInfo'];
            !isset($descriptionTemp[0]) ? $descriptionTemp = [$descriptionTemp] : null;
            foreach ($descriptionTemp as $key => $description) {
                if($description['attr']['Location'] == "6"){
                    //Address
                    if (isset($description['Addresses']['Address'])) {
                        $contactInfos = $contactInfos + array('address' => array());
                        $addressTemp = '';
                        if (isset($description['Addresses']['Address'][0])) { //If has an array of Address
                            foreach ($description['Addresses']['Address'] as $key => $address) {
                                if ($address['attr']['UseType'] == '7') { //Physical address
                                    $addressTemp = $address;
                                }
                            }
                        } else { //If has only one Address
                            $addressTemp = $description['Addresses']['Address'];
                        }
                        !isset($addressTemp['AddressLine'][0]) ? $addressTemp['AddressLine'] = [$addressTemp['AddressLine']] : null;
                        $addressLineComplete = '';
                        foreach ($addressTemp['AddressLine'] as $key => $addressLine) {
                            $addressLineComplete .= $addressLine['value'];
                            if (isset($addressTemp['AddressLine'][$key + 1])) {
                                $addressLineComplete .= ' ';
                            }
                        }
                        $contactInfos['address'] = array(
                            'address_line' => ucwords(strtolower($addressLineComplete)), //Address Line
                            'city_name' => ucwords(strtolower($addressTemp['CityName']['value'])), //City Name
                            'postal_code' => isset($addressTemp['PostalCode']['value']) ? $addressTemp['PostalCode']['value'] : '', //Postal Code
                            'country_name' => Country::where('country_code', $addressTemp['CountryName']['attr']['Code'])->first()["country_name"]); //Country Name
                    }
                    //Contact numbers
                    if (isset($description['Phones']['Phone'])) {
                        $phoneNumbers = $description['Phones']['Phone'];
                        $contactInfos = $contactInfos + array('contact_numbers' => array());
                        !isset($phoneNumbers[0]) ? $phoneNumbers = [$phoneNumbers] : null;
                        foreach ($phoneNumbers as $key => $phoneNumber) {
                            $contactInfos['contact_numbers'] = $contactInfos['contact_numbers'] + array(PhoneTechType::where('phone_tech_code', $phoneNumber['attr']['PhoneTechType'])->first()["phone_tech_name"] => str_replace('+','',str_replace(' ','-', str_replace('/','-',trim($phoneNumber['attr']['PhoneNumber'])))));
                        }
                    }
                    //Emails
                    if (isset($description['Emails']['Email'])) {
                        $emails = $description['Emails']['Email'];
                        $contactInfos = $contactInfos + array('emails' => array());
                        !isset($emails[0]) ? $emails = [$emails] : null;
                        foreach ($emails as $key => $email) {
                            array_push($contactInfos['emails'], $email['value']);
                        }
                    }
                }
            }
        }

        //Awards
        $awards = [];
        $awards_average = 0;
        $awardsTemp = null;
        if (isset($descriptionItem['AffiliationInfo']['Awards']['Award'])) {
            $awardsTemp = $descriptionItem['AffiliationInfo']['Awards']['Award'];
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

        //Position
        $position = '';
        if (isset($descriptionItem['HotelInfo']['Position'])) {
            $positionTemp = $descriptionItem['HotelInfo']['Position']['attr'];
            $position = array('latitude' => $positionTemp['Latitude'], 'longitude' => $positionTemp['Longitude']);
        }

        //Hotel Images
        $imagesHotel = [];
        if (isset($descriptionItem['HotelInfo']['Descriptions']['MultimediaDescriptions']['MultimediaDescription'])) {
            $this->extractBiggerSizeImageFormat($descriptionItem['HotelInfo']['Descriptions']['MultimediaDescriptions']['MultimediaDescription'], $imagesHotel);
        }

        //Room Images
        $imagesRooms = [];
        if (isset($descriptionItem['HotelInfo']['CategoryCodes']['GuestRoomInfo']['MultimediaDescriptions']['MultimediaDescription'])) {
            $this->extractBiggerSizeImageFormat($descriptionItem['HotelInfo']['CategoryCodes']['GuestRoomInfo']['MultimediaDescriptions']['MultimediaDescription'], $imagesRooms);
        }

        //Services
        //Hotel Amenities
        //Accessible Service
        //Security Service
        $generalServices = [];
        $hotelAmenities = [];
        $accessibleServices = [];
        $securityServices = [];
        if (isset($descriptionItem['HotelInfo']['Services']['Service'])) {
            $servicesList = $descriptionItem['HotelInfo']['Services']['Service'];
            !isset($servicesList[0]) ? $servicesList = [$servicesList] : null;
            foreach ($servicesList as $key => $service) {
                if (isset($service['attr'])) {
                    isset($service['attr']['BusinessServiceCode']) ? array_push($generalServices, BusinessService::where('service_code', $service['attr']['BusinessServiceCode'])->first()["service_name"]) : null;
                    isset($service['attr']['Code']) ? array_push($hotelAmenities, Amenity::where('amenity_code', $service['attr']['Code'])->first()["amenity_name"]) : null;
                }
                if (isset($service['Features']['Feature'])) {
                    !isset($service['Features']['Feature'][0]) ? $service['Features']['Feature'] = [$service['Features']['Feature']] : null;
                    foreach ($service['Features']['Feature'] as $accessibleService) {
                        isset($accessibleService['attr']['AccessibleCode']) ? array_push($accessibleServices, DisabilityFeature::where('disability_feature_code', $accessibleService['attr']['AccessibleCode'])->first()["disability_feature_name"]) : null;
                        isset($accessibleService['attr']['SecurityCode']) ? array_push($securityServices, SecurityFeature::where('security_feature_code', $accessibleService['attr']['SecurityCode'])->first()["security_feature_name"]) : null;
                    }
                }
                //If the services has images then add them to $imagesHotel
                if (isset($service['MultimediaDescriptions']['MultimediaDescription'])) {
                    $this->extractBiggerSizeImageFormat($service['MultimediaDescriptions']['MultimediaDescription'], $imagesHotel);
                }
            }
        }

        //Recreations
        $recreations = [];
        if (isset($descriptionItem['AreaInfo']['Recreations']['Recreation'])) {
            $recreationList = $descriptionItem['AreaInfo']['Recreations']['Recreation'];
            !isset($recreationList[0]) ? $recreationList = [$recreationList] : null;
            foreach ($recreationList as $key => $recreation) {
                isset($recreation['attr']['Code']) ? array_push($recreations, RecreationService::where('recreation_service_code', $recreation['attr']['Code'])->first()["recreation_service_name"]) : null;
                //If the recreation has images then add them to $imagesHotel
                if (isset($recreation['MultimediaDescriptions']['MultimediaDescription'])) {
                    $this->extractBiggerSizeImageFormat($recreation['MultimediaDescriptions']['MultimediaDescription'], $imagesHotel);
                }
            }
        }

        //Room Amenities
        $roomAmenities = [];
        if (isset($descriptionItem['FacilityInfo']['GuestRooms']['GuestRoom']['Amenities']['Amenity'])) {
            $amenitiesList = $descriptionItem['FacilityInfo']['GuestRooms']['GuestRoom']['Amenities']['Amenity'];
            !isset($amenitiesList[0]) ? $amenitiesList = [$amenitiesList] : null;
            foreach ($amenitiesList as $key => $amenity) {
                array_push($roomAmenities, RoomAmenity::where('room_amenity_code', $amenity['attr']['RoomAmenityCode'])->first()["room_amenity_name"]);
            }
        }

        //Room Info
        $roomTypes = [];
        if (isset($descriptionItem['HotelInfo']['CategoryCodes']['GuestRoomInfo'])) {
            $guestRoomInfos = $descriptionItem['HotelInfo']['CategoryCodes']['GuestRoomInfo'];
            !isset($guestRoomInfos[0]) ? $guestRoomInfos = [$guestRoomInfos] : null;
            foreach ($guestRoomInfos as $key => $guestRoomInfo) {
                $guestRoomName = GuestRoomInfo::where('guest_room_info_code', $guestRoomInfo['attr']['Code'])->first()["guest_room_info_name"];
                array_push($roomTypes, array($guestRoomName => isset($guestRoomInfo['attr']['Quantity']) ? $guestRoomInfo['attr']['Quantity'] : '?'));
            }
        }

        //Transportation
        $transportation = '';
        if (isset($descriptionItem['AreaInfo']['RefPoints']['RefPoint']['Transportations']['Transportation']['MultimediaDescriptions']['MultimediaDescription']['TextItems']['TextItem']['Description'])) {
            $descriptions = $descriptionItem['AreaInfo']['RefPoints']['RefPoint']['Transportations']['Transportation']['MultimediaDescriptions']['MultimediaDescription']['TextItems']['TextItem']['Description'];
            !isset($descriptions[0]) ? $descriptions = [$descriptions] : null;
            foreach ($descriptions as $key => $description) {
                $transportation .= $description['value'];
            }
        }

        //Accepted Payment
        $acceptedPayment = [];
        if (isset($descriptionItem['Policies']['Policy'])) {
            $policies = $descriptionItem['Policies']['Policy'];
            !isset($policies[0]) ? $policies = [$policies] : null;
            foreach ($policies as $policy) {
                if (isset($policy['GuaranteePaymentPolicy']['GuaranteePayment']['attr']['PaymentCode'])) {
                    $paymentName = PaymentType::where('payment_code', $policy['GuaranteePaymentPolicy']['GuaranteePayment']['attr']['PaymentCode'])->first()["payment_name"];
                    if ($policy['GuaranteePaymentPolicy']['GuaranteePayment']['attr']['PaymentCode'] == '5') {
                        $acceptedPayment = $acceptedPayment + array($paymentName => array());
                        $payments = $policy['GuaranteePaymentPolicy']['GuaranteePayment']['AcceptedPayments']['AcceptedPayment'];
                        !isset($payments[0]) ? $payments = [$payments] : null;
                        foreach ($payments as $payment) {
                            array_push($acceptedPayment[$paymentName], $payment['PaymentCard']['attr']['CardCode']);
                        }
                    }
                }
            }
        }


        return [
            'hotel_code' => isset($descriptionItem['attr']["HotelCode"]) ? $descriptionItem['attr']["HotelCode"] : '',
            'hotel_name' => isset($descriptionItem['attr']["HotelName"]) ? ucwords(strtolower($descriptionItem['attr']["HotelName"])) : '',
            'hotel_description' => $hotelDescription,
            'location_category' => $locationCategory,
            'segment_category' => $segmentCategory,
            'contact_infos' => $contactInfos,
            'awards' => $awards,
            'position' => $position,
            'near_places' => '',
            'hotel_amenities' => $hotelAmenities,
            'hotel_images' => $imagesHotel,
            'general_services' => $generalServices,
            'accessible_services' => $accessibleServices,
            'security_services' => $securityServices,
            'recreations' => $recreations,
            'room_images' => $imagesRooms,
            'room_amenities' => $roomAmenities,
            'room_types' => $roomTypes,
            'policies' => '',
            'accepted_payment' => $acceptedPayment,
            'transportation' => $transportation,
            'affiliation_info' => '',
            'language_code' => ''
        ];
    }


    /******************************************************************************************
     ************************************** Utils *********************************************
     ******************************************************************************************/


    function extractBiggerSizeImageFormat($multimedias, &$imagesArray)
    {
        $description = '';
        !isset($multimedias[0]) ? $multimedias = [$multimedias] : null;
        $imageList = array_column($multimedias, 'ImageItems') ? array_column($multimedias, 'ImageItems') : null;
        if (sizeof($imageList) > 0) { //If has an array of 'ImagesItems'
            foreach ($imageList as $key => $imageItems) {
                !isset($imageItems['ImageItem'][0]) ? $imageItems['ImageItem'] = [$imageItems['ImageItem']] : null;
                foreach ($imageItems['ImageItem'] as $image) {//List of 'ImageItem'
                    if (isset($image['Description'])) {
                        $description = isset($image['Description']['value']) ? $image['Description']['value'] : $image['Description']['attr']['Caption'];
                    }
                    $biggerSize = 0;
                    $imageTemp = '';
                    !isset($image['ImageFormat'][0]) ? $image['ImageFormat'] = [$image['ImageFormat']] : null;
                    foreach ($image['ImageFormat'] as $key2 => $value) {//List of 'ImageFormat'
                        if ($value['attr']['Width'] > $biggerSize && $value['attr']['Width'] <= 1024 && $value['attr']['Width'] >= 300) {
                            $imageTemp = $value['URL']['value'];
                            $biggerSize = $value['attr']['Width'];
                        }
                    }
                    if ($this->remoteImageExists($imageTemp)) {
                        array_push($imagesArray, array('image' => $imageTemp, 'description' => $description));
                    }
                }
            }
        }
    }

    function remoteImageExists($url)
    {
        $curl = curl_init($url);

        //don't fetch the actual page, you only want to check the connection is ok
        curl_setopt($curl, CURLOPT_NOBODY, true);

        //do request
        $result = curl_exec($curl);

        $ret = false;

        //if request did not fail
        if ($result !== false) {
            //if request was ok, check response code
            $statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

            if ($statusCode == 200) {
                $ret = true;
            }
        }
        curl_close($curl);
        return $ret;
    }

}
