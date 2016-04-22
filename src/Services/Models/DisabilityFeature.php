<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class DisabilityFeature extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'disability_features';
    protected $fillable = [
        'disability_feature_code', 'disability_feature_name',
    ];

}
