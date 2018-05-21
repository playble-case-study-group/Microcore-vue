<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Collection;

class AssignmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    }

    /**
     * Return assignment titles given a type of assignment
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $assignments = DB::table('assignments')->where('assign_type_id', $id)->get();

        return $assignments;
    }

    /**
     * Return student submissions given specific assignment
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function retrieveAssignments(Request $request)
    {
        $assignment = DB::table('assignments')->where('assign_id', $request->assignId)->first();

        $arr = json_decode($assignment->requirements, true);

        array_push($arr, $request->classId);

        $type = DB::table('assignment_types')->where('assign_type_id', $assignment->assign_type_id)->first();

        $assignments = DB::select($type->stored_procedure, $arr);

        return $assignments;
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
