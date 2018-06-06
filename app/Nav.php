<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Nav extends Authenticatable
{
    use Notifiable;

    public static function getNotifications() {

        $classId = DB::table('dashboard')
            ->where('day', Auth::user()->current_day)
            ->select('email_count')
            ->first();

            return $classId->email_count;
    }
}
