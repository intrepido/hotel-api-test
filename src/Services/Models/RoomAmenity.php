<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class RoomAmenity extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'room_amenities';
    protected $fillable = [
        'room_amenity_code', 'room_amenity_name',
    ];

}
