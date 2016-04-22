<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class BusinessService extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'business_services';
    protected $fillable = [
        'service_code', 'service_name',
    ];

}
