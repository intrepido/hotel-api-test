<?php

namespace HotelAPI\Services\Models;

use Illuminate\Database\Eloquent\Model;

class MealPlan extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'meals_plan';
    protected $fillable = [
        'meal_plan_code', 'meal_plan_name',
    ];
    protected $connection = 'mysql';

    function __construct() {
        $this->connection = env('API_CONNECTION_DRIVER');
    }

}
