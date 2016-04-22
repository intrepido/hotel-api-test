<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class MeetingRoom extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'meeting_rooms';
    protected $fillable = [
        'meeting_room_code', 'meeting_room_name',
    ];

}
