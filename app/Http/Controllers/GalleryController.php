<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;

class GalleryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gallery = DB::table('artifacts')->get();


        if (Auth::user()->assigned) {
            foreach ($gallery as $artifact) {
                // Searches by group ID
                $edited = DB::table('student_artifacts')
                    ->where([
                        ['group_id', Auth::user()->groupId],
                        ['artifact_id', $artifact->artifact_id],
                    ])
                    ->first();

                $artifact->tags = [];
                if($edited) {
                    $artifact->title = $edited->title;
                    $artifact->description = $edited->description;

                    $artifact->tags = DB::table('tags')
                        ->join('student_artifact_has_tag', 'student_artifact_has_tag.tag_id', 'tags.tag_id')
                        ->where('student_artifact_has_tag.student_artifact_id', $edited->student_artifact_id)
                        ->select('tags.tag_id', 'tags.title')
                        ->get();
                }

                $artifact->hidden = false;

            }

        } else {

            foreach ($gallery as $artifact) {
                // Searches by user ID
                $edited = DB::table('student_artifacts')
                    ->where([
                        ['user_id', Auth::user()->user_id],
                        ['artifact_id', $artifact->artifact_id],
                    ])
                    ->first();

                $artifact->tags = [];
                if($edited) {
                    $artifact->title = $edited->title;
                    $artifact->description = $edited->description;

                    $artifact->tags = DB::table('tags')
                        ->join('student_artifact_has_tag', 'student_artifact_has_tag.tag_id', 'tags.tag_id')
                        ->where('student_artifact_has_tag.student_artifact_id', $edited->student_artifact_id)
                        ->select('tags.tag_id', 'tags.title')
                        ->get();

                }
                $artifact->hidden = false;
            }

        }

        $tags = DB::table('tags')->get();

        return view('gallery', compact('gallery', 'tags'));

    }

    public function getArtifacts()
    {
        $id = Auth::user()->id;
        $baseArtifacts = DB::table('artifacts')
            ->where('created_by', 0)
            ->get();
        $userArtifacts = DB::table('artifacts')
            ->where('created_by', $id)
            ->get();
        $finalArtifacts = array();

        foreach ($baseArtifacts as $artifact) {
            $edited = false;
            foreach ($userArtifacts as $editedArtifact) {
                if($artifact->id == $editedArtifact->edit_id) {
                    array_push($finalArtifacts, $editedArtifact);
                    $edited = true;
                    break;
                }
            }
            if ($edited) {
                $edited = false;
            } else {
                array_push($finalArtifacts, $artifact);
            }
        }
        return $finalArtifacts;
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

        $usr = Auth::user();

        $usr->classId = DB::table('user_has_class')
            ->where('user_id', $usr->user_id)
            ->select('class_id')
            ->first();

        $art = '';

        if ($usr->assigned) {
            // Assigned to a group
            $usr->groupId = DB::table('user_has_group')
                ->where('user_id', $usr->user_id)
                ->select('group_id')
                ->first();

            $art = DB::table('student_artifacts')
                ->where([
                    ['artifact_id', $id],
                    ['group_id', $usr->groupId]
                ])
                ->first();

        } else {
            // If they aren't assigned to a group
            $art = DB::table('student_artifacts')
                ->where([
                    ['artifact_id', $id],
                    ['user_id', $usr->user_id]
                ])
                ->first();

        }



        if($art) {
            DB::table('student_artifacts')
                ->where('student_artifact_id', $art->student_artifact_id)
                ->update([
                    'title' => $request->title,
                    'description' => $request->description,
                    'day' => $usr->current_day
                ]);

            if (count($request->tags)) {
                DB::table('student_artifact_has_tag')
                    ->where('student_artifact_id', $art->student_artifact_id)
                    ->delete();

                foreach ($request->tags as $tag) {
                    DB::table('student_artifact_has_tag')
                        ->insert([
                            'student_artifact_id' => $art->student_artifact_id,
                            'tag_id' => $tag['tag_id']
                        ]);
                }
            }

        } else {

            $id = 0;
            if ($usr->assigned) {
                // Assigned to group
                $id = DB::table('student_artifacts')
                    ->insertGetId([
                        'artifact_id' => $request->galleryId,
                        'title' => $request->title,
                        'description' => $request->description,
                        'img' => $request->img,
                        'user_id' => $usr->user_id,
                        'group_id' => $usr->groupId,
                        'class_id' => Auth::user()->class_id,
                        'day' => $usr->current_day
                    ]);
            } else {
                // Without adding group ID
                $id = DB::table('student_artifacts')
                    ->insertGetId([
                        'artifact_id' => $request->galleryId,
                        'title' => $request->title,
                        'description' => $request->description,
                        'img' => $request->img,
                        'user_id' => $usr->user_id,
                        'class_id' => Auth::user()->class_id,
                        'day' => $usr->current_day
                    ]);
            }

            if ($request->tags) {
                foreach ($request->tags as $tag) {
                    DB::table('student_artifact_has_tag')
                        ->insert([
                            'student_artifact_id' => $id,
                            'tag_id' => $tag['tag_id']
                        ]);
                }
            }

        }

        return 'Success';
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
