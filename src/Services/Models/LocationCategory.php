<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class LocationCategory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'location_categories';
    protected $fillable = [
        'location_category_code', 'location_category_name',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
