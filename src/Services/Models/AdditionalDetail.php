<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class AdditionalDetail extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'additional_details';
    protected $fillable = [
        'additional_detail_code', 'additional_detail_name',
    ];

}
