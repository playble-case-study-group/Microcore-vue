<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\File;
use Illuminate\Support\Facades\Storage;

class EmailController extends Controller
{
    private $image_ext = ['jpg', 'jpeg', 'png', 'gif'];
    private $audio_ext = ['mp3', 'ogg', 'mpga'];
    private $video_ext = ['mp4', 'mpeg'];
    private $document_ext = ['doc', 'docx', 'pdf', 'odt'];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $characterEmails = DB::table('character_email')
            ->join('characters', 'characters.id', 'character_email.character_id')
            ->select('characters.name', 'characters.role', 'character_email.subject', 'character_email.body', 'character_email.day', 'character_email.character_email_id', 'characters.img_small')
            ->where('day', '<=', Auth::user()->current_day)
            ->get();

        foreach($characterEmails as $email){
            $email->reply = DB::table("student_email")
                ->where("character_email_id", $email->character_email_id)
                ->where('user_id', Auth::id())
                ->first();
        }

        $characters = DB::table('characters')->get();

        $studentEmails = DB::table('student_email')
            ->join('characters','characters.id', 'student_email.character_id')
            ->select('student_email.body', 'characters.name', 'student_email.day', 'student_email.student_email_id', 'student_email.subject', 'student_email.character_email_id')
            ->where('user_id', Auth::id())
            ->get();

        foreach ($studentEmails as $email) {
            if ($email->character_email_id) {
                $email->reply = DB::table('character_email')
                    ->where('character_email_id', $email->character_email_id)
                    ->get();
            }
        }
        return view('email', compact('characterEmails', 'characters', 'studentEmails'));
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
        $char_email_id = 0;
//        dd($request->all());
        if ($request->has("character_email_id")) {
            $char_email_id = $request->character_email_id;
        }
            
        if ($request->has("attachment")) {
            $file = $request->file('attachment');
            $ext = $file->getClientOriginalExtension();
            $type = $this->getType($ext);
            $path = '/public/' . $this->getUserDir() . '/' . $file->getClientOriginalName();
            if (Storage::putFileAs('/public/' . $this->getUserDir() . '/' . $type . '/', $file, $file->getClientOriginalName())) {
                DB::table('student_email')->insert([
                    'user_id' => Auth::id(),
                    'character_id' => $request->to,
                    'day' => Auth::user()->current_day,
                    'subject' => "RE: " . $request->subject,
                    'body' => $request->body,
                    'created_at' => DB::raw('NOW()'),
                    'email_attachment' => $path
                ]);
            }
        } else {
            DB::table('student_email')->insert([
                'user_id' => Auth::id(),
                'character_id' => $request->to,
                'day' => Auth::user()->current_day,
                'subject' => "RE: " . $request->subject,
                'body' => $request->body,
                'created_at' => DB::raw('NOW()'),
                'character_email_id' => $char_email_id
            ]);
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
    /**
     * This route returns email data
     */
    public function emailData(Request $request)
    {
        $emails = DB::table('emails')->get();
        return $emails;

    }

    private function getUserDir()
    {
        return Auth::user()->name . '_' . Auth::id();
    }


    /**
     * Get type by extension
     * @param  string $ext Specific extension
     * @return string      Type
     */
    private function getType($ext)
    {
        if (in_array($ext, $this->image_ext)) {
            return 'image';
        }
        if (in_array($ext, $this->audio_ext)) {
            return 'audio';
        }
        if (in_array($ext, $this->video_ext)) {
            return 'video';
        }
        if (in_array($ext, $this->document_ext)) {
            return 'document';
        }
    }
}
