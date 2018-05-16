<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ArticleEditorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $wiki = DB::table('article')->get();

        /*foreach ($wiki as $article) {
            $article->english = DB::table('article')
                ->where('id', $article->lang_1_ar)
                ->first();

            $article->spanish = DB::table('article')
                ->where('id', $article->lang_2_ar)
                ->first();
        }*/

        //dd($wiki);
        return view('articleEditor', compact('wiki'));
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

    public function update(Request $request)
    {
        // get the article object 
        DB::table('article')
            ->where('id', $request->id)
            ->update([
                'content' => $request->content,
                'updated_at' => DB::raw("NOW()")
            ]);
        return "success";

    }

    public function deleteArticle(Request $request)
    {
        // get the article object
        DB::table('article')
            ->where('id', $request->article_id)
            ->delete();
        return $request->all();

    }

    public function addArticle(Request $request)
    {
        // get the article object
        DB::table('article')
            ->insert([
                'title' => $request->article_title
            ]);
        return "success";

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
