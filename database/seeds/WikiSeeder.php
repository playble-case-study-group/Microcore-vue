<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WikiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


//        $id = DB::table('article')->insertGetId([
//            [
//                'lang_id' => 1,
//                'title' => 'Test English',
//                'content' => '{"title": "Civil War", "content": "This is a civil war ", "subtitles": [{"title": "Civil War Subtitle 1", "content": "subtitle 1 contents", "subtitles": []}, {"title": "Civil Ware Subtitle 2", "content": "subtitle 2 contents", "subtitles": [{"title": "sub-sub-title", "content": "something", "subtitles": []}]}]}',
//
//            ],
//            [
//                'lang_id' => 2,
//                'title' => 'Test Spanish',
//                'content' => '{"title": "Guerra Civil", "content": "hola taco burrito", "subtitles": [{"title": "Guerra Civil Subtitle 1", "content": "subtitle 1 contents", "subtitles": []}, {"title": "Guerra Civil Subtitle 2", "content": "subtitle 2 contents", "subtitles": [{"title": "sub-sub-title", "content": "something", "subtitles": []}]}]}',
//
//            ]
//
//

      //  ]);

        $en_id = DB::table('article')->insertGetId(
            [
                'lang_id' => 1,
                'title' => 'Civil War',
                'content' => '# Civil War 
this is some text
## Madrid
more text
### Building',

            ]
        );

        $sp_id = DB::table('article')->insertGetId(
            [
                'lang_id' => 2,
                'title' => 'Guerra Civil',
                'content' => '# Guerra Civil
Contenido uno
## Madrid
es una ciudad
### Edificio',

            ]
        );



        DB::table('wiki')->insert([
            [
                'lang_1_ar' => $en_id,
                'lang_2_ar' => $sp_id
            ]

        ]);

        $en_id = DB::table('article')->insertGetId(
            [
                'lang_id' => 1,
                'title' => 'Test English',
                'content' => '# Test English
Content uno
## Test 2
es una ciudad
### Test 3',

            ]
        );

        $sp_id = DB::table('article')->insertGetId(
            [
                'lang_id' => 2,
                'title' => 'Test Spanish',
                'content' => '# Test Spanish
Contenido uno
## Test test
es una ciudad
### blah',

            ]
        );



        DB::table('wiki')->insert([
            [
                'lang_1_ar' => $en_id,
                'lang_2_ar' => $sp_id
            ]

        ]);
    }
}
