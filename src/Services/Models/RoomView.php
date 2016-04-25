<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class RoomView extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'room_views';
    protected $fillable = [
        'room_view_code', 'room_view_name',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
