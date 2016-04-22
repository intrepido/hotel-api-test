<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class Transportation extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'transportations';
    protected $fillable = [
        'transportation_code', 'transportation_name',
    ];

}
