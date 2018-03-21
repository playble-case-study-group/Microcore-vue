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
        $characterEmails = DB::table('character_email')
            ->join('characters', 'characters.id', 'character_email.character_id')
            ->select('characters.name', 'characters.role', 'character_email.subject', 'character_email.body', 'character_email.day', 'character_email.character_email_id', 'characters.img_small')
            ->where('day', '<=', Auth::user()->current_day)
            ->get();

        $characters = DB::table('characters')->get();

        return view('email', compact('characterEmails', 'characters'));
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
//        DB::table('emails')->insert([
//            'from' => Auth::user()->name,
//           'to' => "Dan",
//           'subject'=> $request->subject,
//            'body' => $request->body
//        ]);
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
}
