<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;

class EmailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $characterEmails = DB::table('character_emails')
            ->join('characters', 'characters.id', 'character_emails.character_id')
            ->select('characters.name', 'characters.role', 'character_emails.subject', 'character_emails.body', 'character_emails.day', 'character_emails.character_email_id', 'characters.img_small')
            ->where('day', '<=', Auth::user()->current_day)
            ->get();

        $characters = DB::table('characters')->get();

        $studentEmails = DB::table('student_emails')
            ->join('characters','characters.id', 'student_emails.character_id')
            ->select('student_emails.body', 'characters.name', 'student_emails.day', 'student_emails.student_email_id', 'student_emails.subject', 'student_emails.character_email_id')
            ->where('user_id', Auth::id())
            ->get();

        foreach ($studentEmails as $email) {
            if ($email->character_email_id) {
                $email->reply = DB::table('character_emails')
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
//        dd($request->all());
        DB::table('student_emails')->insert([
            'user_id' => Auth::id(),
            'character_id' => $request->to['id'],
            'day' => Auth::user()->current_day,
            'subject'=> $request->subject,
            'body' => $request->body,
            'created_at'=> DB::raw('NOW()'),
            'character_email_id' => $request->reply
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

}
