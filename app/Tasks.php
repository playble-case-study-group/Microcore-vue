<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tasks extends Model
{
    // May not need this because it is not being edited from the simulations...
    protected $fillable = ['title', 'description', 'day', 'complete'];
}
