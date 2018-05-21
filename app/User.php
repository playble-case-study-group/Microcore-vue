<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'role', 'assigned'
    ];

    protected $primaryKey = 'user_id';

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token'
    ];


    protected $appends = [
        'group_id',
        'class_id'
    ];

    /**
     * Get the user's group ID.
     *
     * @return string
     */
    public function getGroupIdAttribute()
    {
        $groupId = DB::table('user_has_group')
            ->where('user_id', Auth::id())
            ->select('group_id')
            ->first();

        if ($groupId) {
            return $groupId->group_id;
        } else {
            return false;
        }

    }

    public function getClassIdAttribute() {

        $classId = DB::table('user_has_class')
            ->where('user_id', Auth::id())
            ->select('class_id')
            ->first();

        if ($classId) {
            return $classId->class_id;
        } else {
            return false;
        }
    }
}
