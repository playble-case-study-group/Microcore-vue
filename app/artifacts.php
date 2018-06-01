<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class artifacts extends Model
{
    //
    protected $fillable = ['title', 'description', 'image', 'created_by', 'edit_id', 'catagory'];
}
