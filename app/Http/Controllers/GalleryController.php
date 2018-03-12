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
        //
        return view('gallery');

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
        //
        $artifact = DB::table('artifacts')
            -> where('id', $id)
            -> first();
        // artifact has been edited before
        if ($artifact->edit_id){
            DB::table('artifacts')
                -> where('id', $id)
                -> update([
                    'title'=> $request->artifactTitle,
                    'description' => $request->artifactDescription
                ]);
        }
        // if the artifact has being edited for the first time
        else {
            DB::table('artifacts')
                ->insert([
                    'title' => $request->artifactTitle,
                    'description' => $request->artifactDescription,
                    'image' => $request->artifactImage,
                    'created_by' => $request->user,
                    'edit_ID' => $request->artifactID,
                    'catagory' => $request->catagory
                ]);
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
