<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VideoCallController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $videos = DB::table('video')->get();

        return view('videocall', compact('videos'));
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
        $day = $request->day;
        $note = $request->note;
        $date = date("Y-m-d H:i:s",time());

        $exist = DB::table('notes')
            ->select('user_id')
            ->where('user_id', $user_id)
            ->where('day', $day)
            ->get();
        $exist = json_encode($exist);

        if($exist !== "[]"){
            DB::table('notes')
                ->where('user_id', $user_id)
                ->where('day', $day)
                ->update(['note' => $note]);
        }else{
            DB::table('notes')
                ->insert(['day'=>$day,'user_id' => $user_id,'note' => $note,'created_at'=> $date]);
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
}
