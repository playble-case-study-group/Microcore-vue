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
    }
}
