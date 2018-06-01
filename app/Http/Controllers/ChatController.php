<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class ChatController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chats = DB::table('chats')
            ->join('users', 'users.id', '=', 'chat.user_id')
            ->select('users.name', 'chat.channel_id', 'chat.character_name', 'chat.message', 'chat.created_at', 'chat.type')
            ->where('chat.user_id', Auth::id())
            ->get();

        $channels = DB::table('channels')->get();

        return view('chatbot', compact('chats', 'channels'));
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
        // If type == 0 then it is the users chat
        if(!$request->type) {
            DB::table('chats')->insert([
                'user_id' => Auth::id(),
                'day' => $request->day,
                'message' => $request->message,
                'created_at' => Carbon::now(),
                'type' => $request->type,
                'channel_id' => $request->channel_id
            ]);

        } else {
            DB::table('chats')->insert([
                'user_id' => Auth::id(),
                'day' => $request->day,
                'character_name' => $request->character_name,
                'message' => $request->message,
                'created_at' => Carbon::now(),
                'type' => $request->type,
                'channel_id' => $request->channel_id
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
}
