<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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

    public function resetDay (Request $request) {
        DB::table('users')
            ->where('id', $request->id)
            ->update(['current_day' => $request->day]);

        $removeDay = $request->day;
        $removeDay = $removeDay++;

        DB::table('student_video_submissions')
            ->where('submission_day', $removeDay)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_email')
            ->where('day', $removeDay)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_gallery')
            ->where('day', $removeDay)
            ->where('user_id', Auth::id())
            ->delete();

        return $request->all();
    }

}
