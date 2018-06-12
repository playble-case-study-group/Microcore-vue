<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('group');
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
        $newGroupId = DB::table('groups')
            ->insertGetId([
                'name' => $request->name,
                'created_at' => DB::raw('NOW()')
            ]);

        DB::table('class_has_group')
            ->insert([
                'group_id' => $newGroupId,
                'class_id' => $request->classId
            ]);

        return $newGroupId;
    }

    public function addToGroup(Request $request)
    {
        DB::table('user_has_group')
            ->insert([
                'user_id' => $request->userId,
                'group_id' => $request->groupId
            ]);

        DB::table('users')
            ->where('user_id', $request->userId)
            ->update(['assigned' => 1]);

        return $request->all();
    }

    public function removeFromGroup(Request $request)
    {
        DB::table('user_has_group')
            ->where([
                ['user_id', $request->userId],
                ['group_id', $request->groupId]
            ])->delete();

        DB::table('users')
            ->where('user_id', $request->userId)
            ->update(['assigned' => 0]);

        $user = DB::table('users')
            ->where('user_id', $request->userId)
            ->select('current_day', 'email', 'name', 'user_id')
            ->get();

        return $user;
    }

    public function deleteGroup(Request $request)
    {
        $usrs = DB::table('user_has_group')
            ->where('group_id', $request->groupId)
            ->get();

        if ($usrs) {
            foreach ($usrs as $usr) {
                DB::table('users')
                    ->where('user_id', $usr->user_id)
                    ->update(['assigned' => 0]);

                DB::table('student_artifacts')
                    ->where('user_id', $usr->user_id)
                    ->update(['group_id' => null]);
            }
        }

        DB::table('user_has_group')
            ->where('group_id', $request->groupId)
            ->delete();

        DB::table('groups')
            ->where('group_id', $request->groupId)
            ->delete();
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
    public function destroy(Request $request, $id)
    {
        DB::table('groups')
            ->where('group_id', $id)
            ->delete();

        DB::table('class_has_group')
            ->where('group_id', $id)
            ->delete();

        DB::table('user_has_group')
            ->where('group_id', $id)
            ->delete();

        DB::table('student_artifacts')
            ->where('group_id', $id)
            ->delete();

        return "done";
    }
}
