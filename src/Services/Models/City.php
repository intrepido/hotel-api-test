<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'cities';
    protected $fillable = [
        'city', 'country', 'city_code',
    ];

}
