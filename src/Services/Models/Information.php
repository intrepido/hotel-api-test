<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class Information extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'informations';
    protected $fillable = [
        'information_code', 'information_name',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
