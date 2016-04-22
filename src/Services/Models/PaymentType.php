<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'payment_types';
    protected $fillable = [
        'payment_code', 'payment_name',
    ];

}
