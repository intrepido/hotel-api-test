<?php

namespace HotelAPI\Services\Transformers;

use HotelAPI\Services\Models\BedType;
use HotelAPI\Services\Models\MealPlan;
use HotelAPI\Services\Models\RoomAmenity;
use HotelAPI\Services\Models\RoomCategory;
use HotelAPI\Services\Models\RoomView;
use League\Fractal\TransformerAbstract;


class RoomMultiSingleAvailabilityTransformer extends TransformerAbstract
{
    public function transform(Array $multiSingleAvailabilityItem)
    {
        //Room type
        $roomType = '';
        $roomCategory = '';
        $bedType = '';
        $numBeds = '';
        if (isset($multiSingleAvailabilityItem['RoomTypes']['RoomType']['attr']['RoomType'])) {
            $array = str_split($multiSingleAvailabilityItem['RoomTypes']['RoomType']['attr']['RoomType']);
            foreach ($array as $key => $value) {
                if($value != '*'){
                    $key == 0 ?  $roomCategory = RoomCategory::where('code', $value)->first()["room_category"] : null;
                    $key == 1 ?  $numBeds = (int)$value : null;
                    $key == 2 ?  $bedType = BedType::where('code', $value)->first()["bed_type"] : null;
                }
            }
        }
        $roomType = array('room_category' => $roomCategory, 'num_beds' => $numBeds, 'bed_type' => $bedType);

        //Room total price
        $roomTotalPrice = '';
        if (isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total'])) {
            $amountBeforeTax = '';
            $amountAfterTax = '';
            $currencyCode = '';
            isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['AmountBeforeTax']) ? $amountBeforeTax = ceil($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['AmountBeforeTax']) : null;
            isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['AmountAfterTax']) ? $amountAfterTax = ceil($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['AmountAfterTax']) : null;
            isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['CurrencyCode']) ? $currencyCode = $multiSingleAvailabilityItem['RoomRates']['RoomRate']['Total']['attr']['CurrencyCode'] : null;
            $roomTotalPrice = array('amount_before_tax' => $amountBeforeTax, 'amount_after_tax' => $amountAfterTax, 'currency_code' => $currencyCode );
        }

        //Room average daily rate
        $roomAverageDailyRate = ''; //Average based on rates before taxes if there exist, otherwise is used after taxes.
        if (isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Rates']['Rate'])) {
            $currencyCode = '';
            $ratesTemp = $multiSingleAvailabilityItem['RoomRates']['RoomRate']['Rates']['Rate'];
            !isset($ratesTemp[0]) ? $ratesTemp = [$ratesTemp] : null;
            $total = 0;
            $hasTotal = 0; //Sometimes the list has a last item named Total, that we don't want
            foreach ($ratesTemp as $key => $rate) {
                if(isset($rate['Base'])){
                    $total += isset($rate['Base']['attr']['AmountBeforeTax']) ? $rate['Base']['attr']['AmountBeforeTax'] : $rate['Base']['attr']['AmountAfterTax'];
                    (empty($currencyCode) && isset($rate['Base']['attr']['CurrencyCode'])) ? $currencyCode = $rate['Base']['attr']['CurrencyCode'] : null;
                }else{
                    $hasTotal++;
                }
            }
            $roomAverageDailyRate =  array('amount' => ceil($total/(sizeof($ratesTemp)-$hasTotal)), 'dollar_conversion' => '','currency_code' => $currencyCode);
        }

        //Room description
        $roomDescription = []; //Wrong formatted from Amadeus
        if (isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['RoomRateDescription'])) {
            $roomDescriptionTemp = $multiSingleAvailabilityItem['RoomRates']['RoomRate']['RoomRateDescription']['Text'];
            !isset($roomDescriptionTemp[0]) ? $roomDescriptionTemp = [$roomDescriptionTemp] : null;
            foreach ($roomDescriptionTemp as $key => $description) {
                isset($description['value']) ? array_push($roomDescription, ucwords(strtolower(trim($description['value'])))) : null;
            }
        }

        //Room features
        $roomFeatures = [];
        $roomAmenities = [];
        $roomViews = [];
        if (isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Features'])) {
            $roomFeatureTemp = $multiSingleAvailabilityItem['RoomRates']['RoomRate']['Features']['Feature'];
            !isset($roomFeatureTemp[0]) ? $roomFeatureTemp = [$roomFeatureTemp] : null;
            foreach ($roomFeatureTemp as $key => $feature) {
                if(isset($feature['attr']['RoomAmenity'])){
                    $roomAmenityName = RoomAmenity::where('room_amenity_code', (int)$feature['attr']['RoomAmenity'])->first()["room_amenity_name"];
                    !in_array($roomAmenityName, $roomAmenities) ? array_push($roomAmenities, $roomAmenityName) : null;
                }
                if(isset($feature['attr']['RoomViewCode'])){
                    $roomViewName = RoomView::where('room_view_code', (int)$feature['attr']['RoomViewCode'])->first()["room_view_name"];
                    !in_array($roomViewName, $roomViews) ? array_push($roomViews, $roomViewName) : null;
                }
            }
            $roomFeatures = $roomFeatures + array('room_amenities' => $roomAmenities);
            $roomFeatures = $roomFeatures + array('room_views' => $roomViews);
        }

        //Max Occupancy
        $maxOccupancy = ''; //Always are adults in one room
        if (isset($multiSingleAvailabilityItem['GuestCounts']['GuestCount'])) {
            $maxOccupancy = (int)$multiSingleAvailabilityItem['GuestCounts']['GuestCount']['attr']['Count'];
        }

        //Cancellation
        $cancellation = [];
        if (isset($multiSingleAvailabilityItem['RatePlans']['RatePlan']['CancelPenalties']['CancelPenalty'])) {
            $cancelPenaltyTemp = $multiSingleAvailabilityItem['RatePlans']['RatePlan']['CancelPenalties']['CancelPenalty'];
            !isset($cancelPenaltyTemp[0]) ? $cancelPenaltyTemp = [$cancelPenaltyTemp] : null;
            foreach ($cancelPenaltyTemp as $key => $penalty) {
                $deadline = isset($penalty['Deadline']['attr']['AbsoluteDeadline']) ? $penalty['Deadline']['attr']['AbsoluteDeadline'] : '';
                $numberDueNights = isset($penalty['AmountPercent']['attr']['NmbrOfNights']) ? (int)$penalty['AmountPercent']['attr']['NmbrOfNights'] : '';
                $percentDiscountFromTotal = isset($penalty['AmountPercent']['attr']['Percent']) ? (float)$penalty['AmountPercent']['attr']['Percent'] : '';
                $totalCancellationFee = isset($penalty['AmountPercent']['attr']['Amount']) ? (float)$penalty['AmountPercent']['attr']['Amount'] : '';
                $currencyCode = isset($penalty['AmountPercent']['attr']['CurrencyCode']) ? $penalty['AmountPercent']['attr']['CurrencyCode'] : '';
                $penalityDescription = '';
                if(isset($cancelPenaltyTemp['PenaltyDescription'])){
                    foreach ($cancelPenaltyTemp['PenaltyDescription']['Text'] as $key => $description) {
                        array_push($penalityDescription, $description['value']);
                    }
                }
                $cancellation = $cancellation + array('penality_description' => $penalityDescription,
                                      'cancellation_type' => $penalty['attr']['PolicyCode'],
                                      'deadline' => $deadline,
                                      'number_due_nights' => $numberDueNights,
                                      'percent_discount_from_total' => $percentDiscountFromTotal,
                                      'total_cancellation_fee' => $totalCancellationFee,
                                      'currency_code' => $currencyCode );
            }
        }

        //Guarantee and Accepted Payments
        $acceptedPayments = [];
        $guarantee = [];
        $holdTime = '';
        $guaranteeTypes= [];
        $guaranteesAccepted = [];
        if (isset($multiSingleAvailabilityItem['RoomRates']['RoomRate']['Rates']['Rate']['PaymentPolicies'])) {
            $guaranteePaymentTemp = $multiSingleAvailabilityItem['RoomRates']['RoomRate']['Rates']['Rate']['PaymentPolicies']['GuaranteePayment'];
            !isset($guaranteePaymentTemp[0]) ? $guaranteePaymentTemp = [$guaranteePaymentTemp] : null;
            foreach ($guaranteePaymentTemp as $key => $guaranteePayment) {
                //Guarantee Types
                if(isset($guaranteePayment['attr']['PaymentCode'])){
                    if($guaranteePayment['attr']['PaymentCode'] == '31'){ //Guarantee Required
                        !in_array('Guarantee Required', $guaranteeTypes) ? array_push($guaranteeTypes, 'Guarantee Required') : null;
                    }
                    if($guaranteePayment['attr']['PaymentCode'] == '8'){ //Deposit
                        !in_array('Deposit', $guaranteeTypes) ? array_push($guaranteeTypes, 'Deposit') : null;
                    }
                }
                //Hold Time
                if(isset($guaranteePayment['attr']['HoldTime'])){
                    $holdTime = $guaranteePayment['attr']['HoldTime'];
                }
                //Accepted Payments
                if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment'])){
                    //Payment Card
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['PaymentCard']['attr']['CardCode'])){
                        !isset($acceptedPayments['payment_card']) ? $acceptedPayments = $acceptedPayments + array('payment_card' => []) : null;
                        array_push($acceptedPayments['payment_card'], $guaranteePayment['AcceptedPayments']['AcceptedPayment']['PaymentCard']['attr']['CardCode']);
                    }
                    //Bank Account
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['BankAcct']['attr']['CheckAcceptedInd'])){
                        $guaranteePayment['AcceptedPayments']['AcceptedPayment']['BankAcct']['attr']['CheckAcceptedInd'] == 'true' ? $acceptedPayments = $acceptedPayments + array('bank_acct' => true) : null;
                    }
                    //Direct Bill
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['DirectBill'])){
                        $acceptedPayments = $acceptedPayments + array('direct_bill' => true);
                    }
                    //Loyalty Redemption
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['LoyaltyRedemption'])){
                        $acceptedPayments = $acceptedPayments + array('loyalty_redemption' => true);
                    }
                    //Misc Charge Order
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['MiscChargeOrder'])){
                        $acceptedPayments = $acceptedPayments + array('misc_charge_order' => true);
                    }
                    //Cash
                    if(isset($guaranteePayment['AcceptedPayments']['AcceptedPayment']['Cash'])){
                        $acceptedPayments = $acceptedPayments + array('cash' => true);
                    }
                }
            }
        }else{
            if(isset($multiSingleAvailabilityItem['RatePlans']['RatePlan']['Guarantee'])){
                $guaranteeTemp = $multiSingleAvailabilityItem['RatePlans']['RatePlan']['Guarantee'];
                //Guarantee Types
                if(isset($guaranteeTemp['attr']['GuaranteeCode'])){
                    if($guaranteeTemp['attr']['GuaranteeCode'] == '31'){
                        !in_array('Guarantee Required', $guaranteeTypes) ? array_push($guaranteeTypes, 'Guarantee Required') : null;
                    }
                    if($guaranteeTemp['attr']['GuaranteeCode'] == '8'){
                        !in_array('Deposit', $guaranteeTypes) ? array_push($guaranteeTypes, 'Deposit') : null;
                    }
                }
                //Hold Time
                if(isset($guaranteeTemp['attr']['HoldTime'])){
                    $holdTime = $guaranteeTemp['attr']['HoldTime'];
                }
                //Guarantee Accepted
                if(isset($guaranteeTemp['GuaranteesAccepted'])){
                    $guaranteeAcceptedTemp = $guaranteeTemp['GuaranteesAccepted']['GuaranteeAccepted'];
                    !isset($guaranteeAcceptedTemp[0]) ? $guaranteeAcceptedTemp = [$guaranteeAcceptedTemp] : null;
                    foreach ($guaranteeAcceptedTemp as $key => $guaranteeAccepted) {
                        if(isset($guaranteeAccepted['attr'])){
                            if(isset($guaranteeAccepted['attr']['BookingSourceAllowedInd'])){
                                $guaranteeAccepted['attr']['BookingSourceAllowedInd'] == '1' ? array_push($guaranteesAccepted, 'The booking source may be used to guarantee the booking') : null;
                            }
                            if(isset($guaranteeAccepted['attr']['CorpDiscountNbrAllowedInd'])){
                                $guaranteeAccepted['attr']['CorpDiscountNbrAllowedInd'] == '1' ? array_push($guaranteesAccepted, 'The corporate discount number may be used to guarantee the booking') : null;
                            }
                        }

                        //Accepted Payments
                        //Payment Card
                        if(isset($guaranteeAccepted['PaymentCard']['attr']['CardCode'])){
                            !isset($acceptedPayments['payment_card']) ? $acceptedPayments = $acceptedPayments + array('payment_card' => []) : null;
                            array_push($acceptedPayments['payment_card'], $guaranteeAccepted['PaymentCard']['attr']['CardCode']);
                        }
                        //Bank Account
                        if(isset($guaranteeAccepted['BankAcct']['attr']['CheckAcceptedInd'])){
                            $guaranteeAccepted['BankAcct']['attr']['CheckAcceptedInd'] == 'true' ? $acceptedPayments = $acceptedPayments + array('bank_acct' => true) : null;
                        }
                        //Direct Bill
                        if(isset($guaranteeAccepted['DirectBill'])){
                            $acceptedPayments = $acceptedPayments + array('direct_bill' => true);
                        }
                        //Loyalty Redemption
                        if(isset($guaranteeAccepted['LoyaltyRedemption'])){
                            $acceptedPayments = $acceptedPayments + array('loyalty_redemption' => true);
                        }
                        //Misc Charge Order
                        if(isset($guaranteeAccepted['MiscChargeOrder'])){
                            $acceptedPayments = $acceptedPayments + array('misc_charge_order' => true);
                        }
                        //Cash
                        if(isset($guaranteeAccepted['Cash'])){
                            $acceptedPayments = $acceptedPayments + array('cash' => true);
                        }
                    }
                }
            }
        }
        $guarantee = $guarantee + array('hold_time' => $holdTime, 'guarantee_types' => $guaranteeTypes, 'guarantees_accepted' => $guaranteesAccepted);

        //Meals included
        $mealsIncluded = [];
        if (isset($multiSingleAvailabilityItem['RatePlans']['RatePlan']['MealsIncluded'])) {
            $mealsTemp = $multiSingleAvailabilityItem['RatePlans']['RatePlan']['MealsIncluded'];
            !isset($mealsTemp[0]) ? $mealsTemp = [$mealsTemp] : null;
            $breakfast = false;
            $mealsPlan = [];
            foreach ($mealsTemp as $key => $meal) {
                if(isset($meal['attr']['Breakfast']) && !$breakfast){
                    $meal['attr']['Breakfast'] == '1' ? $breakfast = true : null;
                }
                if(isset($meal['attr']['MealPlanCodes'])){
                    array_push($mealsPlan, MealPlan::where('meal_plan_code', $meal['attr']['MealPlanCodes'])->first()['meal_plan_name']);
                }
            }
            $mealsIncluded = array('breakfast_included' => $breakfast, 'meal_plans' => $mealsPlan);
        }

        return [
            'room_type' => $roomType,
            'room_total_price' => $roomTotalPrice,
            'room_average_daily_rate' => $roomAverageDailyRate,
            'room_description' => $roomDescription,
            'room_features' => $roomFeatures,
            'max_occupancy' => $maxOccupancy,
            'cancellation' => $cancellation,
            'guarantee' => $guarantee,
            'accepted_payments' => $acceptedPayments,
            'meals_included' => $mealsIncluded
        ];
    }

}

