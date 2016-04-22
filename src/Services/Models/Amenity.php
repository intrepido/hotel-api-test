<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class Amenity extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'amenities';
    protected $fillable = [
        'amenity_code', 'amenity_name',
    ];

}
