<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class PictureCategory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'picture_categories';
    protected $fillable = [
        'picture_category_code', 'picture_category_name',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
