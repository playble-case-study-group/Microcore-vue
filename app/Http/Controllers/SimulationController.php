<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use function MongoDB\BSON\toJSON;

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

        DB::table('student_read_emails')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_artifacts')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();

        DB::table('student_tasks')
            ->join('tasks', 'student_tasks.task_id', '=','tasks.task_id')
            ->where('day', $request->day)
            ->where('student_id', Auth::id())
            ->delete();

        DB::table('user_asked_questions')
            ->where('day', $request->day)
            ->where('user_id', Auth::id())
            ->delete();


        return $request->all();
    }

    public static function getEmailNotifications() {

        $current_day = Auth::user()->current_day;
        $user_id = Auth::id();

        $emails = DB::table('character_emails')
            ->where('day', '<=', $current_day)
            ->count();

        $read_emails = DB::table('student_read_emails')
            ->where('day', '<=', $current_day)
            ->where('user_id', $user_id)
            ->count();

        $total_unread = $emails - $read_emails;

        return $total_unread;
    }

    public static function getGalleryNotifications() {

        $visited_gallery = DB::table('student_visited_gallery')
            ->where('day', '=' ,Auth::user()->current_day)
            ->where('user_id', Auth::id())
            ->count();

        $artifact_count = 0;

        if($visited_gallery == 0) {
            $artifacts = DB::table('artifacts')
                ->where('day', '=' ,Auth::user()->current_day)
                ->count();
            $artifact_count = $artifacts;
        }

        return $artifact_count;
    }

    public static function visitedGallery(Request $request) {

        $visited_gallery = DB::table('student_visited_gallery')
            ->where('day', '=' ,Auth::user()->current_day)
            ->where('user_id', Auth::id())
            ->count();

        if($visited_gallery == 0) {
            DB::table('student_visited_gallery')
                ->insert(['user_id' => Auth::id(), 'day' => Auth::user()->current_day]);

        }
        return $request->all();
    }

}
