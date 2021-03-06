<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class BedType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'bed_types';
    protected $fillable = [
        'bed_type', 'code',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
