<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

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
            ->where('user_id', $request->id)
            ->update(['current_day' => $request->day]);

    }

    public function resetDay (Request $request) {
        $backDay = $request->day;
        if($backDay != 1){
            $backDay -= 1;
        }

        DB::table('users')
            ->where('user_id', $request->id)
            ->update(['current_day' => $backDay]);


        // if not on the first day, reset the previous day.
        $delete_videos = DB::table('student_video_submissions')
            ->select('submission_url')
            ->where('submission_day', $request->day)
            ->where('user_id', Auth::id())
            ->get();

        $delete_videos = collect($delete_videos)->pluck('submission_url')->all();

        File::delete($delete_videos);

        DB::table('student_video_submissions')
            ->where('submission_day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_emails')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_artifacts')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('user_asked_questions')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();


        return $request->all();
    }

}
