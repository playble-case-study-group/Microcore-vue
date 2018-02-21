<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SimulationController extends Controller
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

    public function updateDay (Request $request) {
        DB::table('users')
            ->where('id', $request->id)
            ->update(['current_day' => $request->day]);

    }

}
