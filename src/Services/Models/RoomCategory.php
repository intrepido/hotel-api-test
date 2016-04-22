<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class RoomCategory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'room_categories';
    protected $fillable = [
        'room_category', 'code',
    ];

}
