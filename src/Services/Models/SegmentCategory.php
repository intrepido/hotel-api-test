<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class SegmentCategory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'segment_categories';
    protected $fillable = [
        'segment_category_code', 'segment_category_name',
    ];

}
