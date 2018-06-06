<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Nav extends Authenticatable
{

    public static function getNotifications() {

        $emails = DB::table('character_emails')
            ->where('day', '<=' ,Auth::user()->current_day)
            ->count();

        $read_emails = DB::table('student_read_emails')
            ->where('day', '<=' ,Auth::user()->current_day)
            ->where('user_id', Auth::id())
            ->count();

        $total_unread = $emails - $read_emails;

            return $total_unread;
    }
}
