<?php

namespace App\Http\Controllers;

<<<<<<< HEAD
=======
use Illuminate\Http\Request;
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
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