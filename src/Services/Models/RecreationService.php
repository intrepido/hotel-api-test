<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class RecreationService extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'recreation_services';
    protected $fillable = [
        'recreation_service_code', 'recreation_service_name',
    ];

}
