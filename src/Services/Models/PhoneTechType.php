<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class PhoneTechType extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'phone_tech_types';
    protected $fillable = [
        'phone_tech_code', 'phone_tech_name',
    ];

}
