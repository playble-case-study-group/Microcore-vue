<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class VideoCallController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contacts = DB::table('characters')->get();
        $calls = DB::table('videos')
            ->where('day', Auth::user()->current_day)
            ->get();

        $questions = DB::table('questions')->get();

        $clicked_questions = DB::table('user_asked_questions')
            ->select('question_id')
            ->where('user_id', Auth::id())
            ->get();

        $clicked_questions = collect($clicked_questions)->unique('question_id')->pluck('question_id')->all();
        $clicked_questions = json_encode($clicked_questions);

        $notes = DB::table('notes')
            ->select('note')
            ->where('user_id', Auth::id())
            ->first();
        if($notes == null){
            $notes = (object)['note' => ''];
        }
        $notes = json_encode($notes);

        return view('videocall', compact('calls', 'questions', 'notes', 'contacts', 'clicked_questions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $user_id = $request->user;
        $note = $request->note;


        $exist = DB::table('notes')
            ->select('user_id')
            ->where('user_id', $user_id)
            ->get();
        $exist = json_encode($exist);

        if($exist !== "[]"){
            DB::table('notes')
                ->where('user_id', $user_id)
                ->update(['note' => $note, 'updated_at' => DB::raw("NOW()")]);
        }else{
            DB::table('notes')
                ->insert(['user_id' => $user_id,'note' => $note, 'day' =>  Auth::user()->current_day,'created_at'=> DB::raw("NOW()")]);
        }
        return $request->all();

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $notes = DB::table('notes')
            ->select('day', 'note')
            ->where('user_id', $id)
            ->get();
        return response()->json($notes);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function disableQuestion(Request $request){
        $question_id = $request->id;
        DB::table('user_asked_questions')
            ->insert(['question_id' => $question_id, 'user_id' => Auth::id(), 'day' => Auth::user()->current_day]);

        return $request->all();
    }


    public function saveFile(Request $request){
        $user_id = $request->user;
        $character_id = $request->character;
        $video = $request->blob;
        $day = Auth::user()->current_day;
        $date = date("Y-m-d H:i:s",time());
        $class_id = Auth::user()->class_id;


        $data = base64_decode(preg_replace('#^data:text/\w+;base64,#i', '', $video));
        header('Content-Type: video/webm');
        $name = 'video-'.str_random(4).'.webm';
        $target_file = base_path()."/public/storage/video/".$name;

        if(!File::exists('public/storage/video/')) {
            File::makeDirectory('storage/video/');
        }

        file_put_contents($target_file, $data);
        $filename = "storage/video/".$name;

        if($request->has('question')){
            $question_id = $request->question;

            DB::table('student_video_submissions')
                ->insert(['class_id' => $class_id, 'submission_url' => $filename, 'submission_day' => $day, 'character_id' => $character_id, 'user_id' => $user_id,'question_id' => $question_id,'created_at'=> $date]);
        } else {

            DB::table('student_video_submissions')
                ->insert(['class_id' => $class_id, 'submission_url' => $filename, 'submission_day' => $day, 'character_id' => $character_id, 'user_id' => $user_id, 'created_at' => $date]);
        }

        return $request->all();
    }

}
