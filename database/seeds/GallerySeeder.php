<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GallerySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('gallery')->truncate();
        DB::table('gallery')->insert([
            [
                'title' => 'Gallery 1 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery01.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 2 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery02.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 3 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery03.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 4 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery04.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 5 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery05.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 6 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery06.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 7 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery07.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 8 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery08.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 9 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery09.png',
                'created_at' => DB::raw('NOW()')
            ],
            [
                'title' => 'Gallery 10 Title',
                'description' => 'This is the description',
                'image' => '/images/gallery/gallery10.png',
                'created_at' => DB::raw('NOW()')
            ],

        ]);

        DB::table('tag')->truncate();
        DB::table('tag')->insert([
            ['tag_id' => 1, 'title' => 'Tag 1'],
            ['tag_id' => 2, 'title' => 'Tag 2'],
            ['tag_id' => 3, 'title' => 'Tag 3'],
            ['tag_id' => 4, 'title' => 'Tag 4']
        ]);

        DB::table('gallery_has_tag')->truncate();
        DB::table('gallery_has_tag')->insert([
            ['gallery_id' =>  1, 'tag_id' => 1],
            ['gallery_id' =>  1, 'tag_id' => 2],
            ['gallery_id' =>  1, 'tag_id' => 3],
            ['gallery_id' =>  2, 'tag_id' => 1],
            ['gallery_id' =>  2, 'tag_id' => 2],
            ['gallery_id' =>  2, 'tag_id' => 4],
            ['gallery_id' =>  3, 'tag_id' => 1],
            ['gallery_id' =>  4, 'tag_id' => 1],
            ['gallery_id' =>  5, 'tag_id' => 2],
            ['gallery_id' =>  6, 'tag_id' => 2],
            ['gallery_id' =>  7, 'tag_id' => 4]
        ]);
    }
}
