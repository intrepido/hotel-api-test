<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class Chain extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'chains';
    protected $fillable = [
        'chain_code', 'chain_name',
    ];

}
