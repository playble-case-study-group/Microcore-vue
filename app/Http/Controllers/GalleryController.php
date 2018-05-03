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
        $gallery = DB::table('gallery')->get();

        foreach ($gallery as $artifact) {
            $edited = DB::table('student_gallery')
                ->where([
                    ['group_id', Auth::user()->groupId],
                    ['gallery_id', $artifact->gallery_id],
                ])
                ->first();

            if($edited) {
                $artifact->title = $edited->title;
                $artifact->description = $edited->description;
            }

//            dd($artifact);

            $artifact->hidden = false;
            $artifact->tags = DB::table('tag')
                ->join('gallery_has_tag', 'gallery_has_tag.tag_id', 'tag.tag_id')
                ->where('gallery_has_tag.gallery_id', $artifact->gallery_id)
                ->select('tag.tag_id', 'tag.title')
                ->get();
        }

        $tags = DB::table('tag')->get();

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
            ->where('user_id', $usr->id)
            ->select('class_id')
            ->first();

        $usr->groupId = DB::table('user_has_group')
            ->where('user_id', $usr->id)
            ->select('group_id')
            ->first();

        $art = DB::table('student_gallery')
            ->where([
                ['gallery_id', $id],
                ['group_id', $usr->groupId]
            ])
            ->first();

        if($art) {
            DB::table('student_gallery')
                ->where('student_gallery_id', $art->student_gallery_id)
                ->update([
                    'title' => $request->title,
                    'description' => $request->description
                ]);
        } else {
            DB::table('student_gallery')
                ->insert([
                    'gallery_id' => $request->galleryId,
                    'title' => $request->title,
                    'description' => $request->description,
                    'img' => $request->img,
                    'user_id' => $usr->id,
                    'group_id' => $usr->groupId->group_id,
                    'class_id' => $usr->classId->class_id
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
    public function destroy($id)
    {
        //
    }
}
