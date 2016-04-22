<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class GuestRoomInfo extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'guest_room_infos';
    protected $fillable = [
        'guest_room_info_code', 'guest_room_info_name',
    ];

}
