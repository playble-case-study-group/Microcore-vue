<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dash = DB::table('dashboard')
            ->where('day', Auth::user()->current_day)
            ->first();
        $dash = json_encode($dash);
        $notes = DB::table('notes')
            ->select('note')
            ->where('user_id', Auth::id())
            ->first();
        if($notes == null){
            $notes = (object)['note' => ''];
        }
        $notes = json_encode($notes);

        return view('dash', compact('dash', 'notes'));
    }

    public function user()
    {
        return Auth::user();
    }
}
