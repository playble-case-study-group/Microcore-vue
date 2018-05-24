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

        $reqs = json_decode($assignment->requirements, true);

        $reqs->classId = $request->classId;

        dd($reqs);

        $type = DB::table('assignment_types')->where('assign_type_id', $assignment->assign_type_id)->first();

        $assignments = collect();

        switch ($type->assign_type_id) {
            case 1:
                $assignments = $this->retrieveEmailAssignments($arr[0], $arr[1], $arr[2]);
                break;
            case 2:
                $assignments = $this->retrieveGalleryAssignments($arr[0]);
                break;
            case 3:
                $assignments = $this->retrieveVideoAssignments($arr[0], $arr[1], $arr[2]);
                break;
        }

//        $assignments = DB::select($type->stored_procedure, $arr);

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

    private function retrieveEmailAssignments($characterId, $day, $classId)
    {
        
    }

    private function retrieveGalleryAssignments($classId)
    {

    }

    private function retrieveVideoAssignments($questionId, $day, $classId)
    {

    }
}
