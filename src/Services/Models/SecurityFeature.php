<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class SecurityFeature extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'security_features';
    protected $fillable = [
        'security_feature_code', 'security_feature_name',
    ];

}
