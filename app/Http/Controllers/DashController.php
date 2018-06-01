<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class DashController extends Controller
{
    //
    public function loadDash()
    {
        $dash = DB::table('dashboard')
            ->where('day', Auth::user()->current_day)
            ->first();
        $dash = json_encode($dash);
        $notes = DB::table('notes')
            ->select('note')
            ->where('user_id', Auth::id())
            ->first();
        $notes = json_encode($notes);

        return view('dash', compact('dash', 'notes'));
    }
}
