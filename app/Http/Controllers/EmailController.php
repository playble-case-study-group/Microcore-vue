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
        $characterEmails = DB::table('character_emails')
            ->join('characters', 'characters.character_id', 'character_emails.character_id')
            ->select('characters.name', 'characters.role', 'character_emails.subject', 'character_emails.body', 'character_emails.day', 'character_emails.character_email_id', 'characters.img_small')
            ->where('day', '<=', Auth::user()->current_day)
            ->orderBy('day', 'desc')
            ->get();

        foreach($characterEmails as $email){
            $email->reply = DB::table("student_emails")
                ->where("character_email_id", $email->character_email_id)
                ->where('user_id', Auth::id())
                ->first();
        }

        foreach($characterEmails as $email){
            $read = DB::table("student_read_emails")
                ->where("character_email_id", $email->character_email_id)
                ->where('user_id', Auth::id())
                ->first();
            if($read){
                $email->read = true;
            } else {
                $email->read = false;
            }
        }

        $characters = DB::table('characters')->get();

        $studentEmails = DB::table('student_emails')
            ->join('characters','characters.character_id', 'student_emails.character_id')
            ->select('student_emails.body', 'characters.name', 'student_emails.day', 'student_emails.student_email_id', 'student_emails.subject', 'student_emails.character_email_id')
            ->where('user_id', Auth::id())
            ->get();

        foreach ($studentEmails as $email) {
            if ($email->character_email_id) {
                $email->reply = DB::table('character_emails')
                    ->where('character_email_id', $email->character_email_id)
                    ->first();
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

        if ($request->has("attachment")) {
            $file = $request->file('attachment');
            $ext = $file->getClientOriginalExtension();
            $type = $this->getType($ext);
            $path = '/storage/' . $type . '/' . $file->getClientOriginalName();

            if (Storage::putFileAs('/storage/' . $type . '/', $file, $file->getClientOriginalName())) {
                DB::table('student_emails')->insert([
                    'user_id' => Auth::id(),
                    'character_id' => $request->to,
                    'day' => Auth::user()->current_day,
                    'subject' => $request->has('character_email_id') ? "RE: " . $request->subject : $request->subject,
                    'body' => $request->body,
                    'created_at' => DB::raw('NOW()'),
                    'email_attachment' => $path,
                    'character_email_id' => $request->has('character_email_id') ? $request->character_email_id : 0,
                ]);
            }
        } else {
            DB::table('student_emails')->insert([
                'user_id' => Auth::id(),
                'character_id' => $request->to,
                'day' => Auth::user()->current_day,
                'subject' => $request->has('character_email_id') ? "RE: " . $request->subject : $request->subject,
                'body' => $request->body,
                'created_at' => DB::raw('NOW()'),
                'character_email_id' => $request->has('character_email_id') ? $request->character_email_id : 0,
            ]);
        }

        return $request->all();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function readEmail(Request $request)
    {
        $email_id = $request->email_id;

        DB::table('student_read_emails')->insert([
            'user_id' => Auth::id(),
            'day' => Auth::user()->current_day,
            'created_at' => DB::raw('NOW()'),
            'character_email_id' => $email_id,
        ]);
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
