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

        $reqs['classId'] = $request->classId;

        $type = DB::table('assignment_types')->where('assign_type_id', $assignment->assign_type_id)->first();

        $assignments = collect();

        switch ($type->assign_type_id) {
            case 1:
                $assignments = $this->retrieveEmailAssignments($reqs['characterId'], $reqs['day'], $reqs['classId']);
                break;
            case 2:
                $assignments = $this->retrieveGalleryAssignments($reqs['classId']);
                break;
            case 3:
                $assignments = $this->retrieveVideoAssignments($reqs['questionId'], $reqs['day'], $reqs['characterId'], $reqs['classId']);
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
        return DB::table('student_emails AS s')
            ->join('users AS u', 'u.user_id', '=', 's.user_id')
            ->join('characters AS c', 'c.character_id', '=', 's.character_id')
            ->where([
                ['s.class_id', '=', $classId],
                ['s.day', '=', $day],
                ['s.character_id', '=', $characterId]
            ])
            ->select('s.day', 's.subject', 's.body', 's.created_at', 'c.name AS c_name', 'u.name AS u_name')
            ->get();
    }

    private function retrieveGalleryAssignments($classId)
    {
        $artifacts = DB::table('student_artifacts AS s')
            ->join('users AS u', 'u.user_id', '=', 's.user_id')
            ->join('user_has_group AS ug', 'ug.user_id', '=', 'u.user_id')
            ->join('groups AS g', 'g.group_id', '=', 'ug.group_id')
            ->where('s.class_id', $classId)
            ->select('s.title', 's.student_artifact_id', 's.description', 'u.name AS u_name', 's.img', 'g.name AS g_name')
            ->get();

        foreach ($artifacts as $art) {
            $art->tags = DB::table('tags')
                ->join('student_artifact_has_tag', 'student_artifact_has_tag.tag_id', 'tags.tag_id')
                ->where('student_artifact_has_tag.student_artifact_id', $art->student_artifact_id)
                ->select('tags.tag_id', 'tags.title')
                ->get();
        }

        return $artifacts;

    }

    private function retrieveVideoAssignments($questionId, $day, $characterId, $classId)
    {
        return DB::table('student_video_submissions AS s')
            ->join('users AS u', 'u.user_id', '=', 's.user_id')
            ->join('questions AS q', 'q.question_id', '=', 's.question_id')
            ->where([
                ['s.question_id', '=', $questionId],
                ['s.submission_day', '=', $day],
                ['s.character_id', '=', $characterId],
                ['s.class_id', '=', $classId]
            ])
            ->select('u.name AS u_name', 'q.question', 's.submission_url AS response')
            ->get();
    }
}
