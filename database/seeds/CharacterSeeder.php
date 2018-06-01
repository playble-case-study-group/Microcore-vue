<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CharacterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('characters')->truncate();

        DB::table('characters')->insert([
            [
                'name' => 'Ernando Suarez',
                'role' => 'Head Curator',
                'img_small' => 'img/characters/ernando-small.png',
                'img_large' => 'img/characters/ernando-large.png'
            ],
            [
                'name' => 'Ana Alba',
                'role' => 'Marketing',
                'img_small' => 'img/characters/ana-small.png',
                'img_large' => 'img/characters/ana-large.png'
            ],
            [
                'name' => 'Phillip Iniesta',
                'role' => 'Technical',
                'img_small' => 'img/characters/phillip-small.png',
                'img_large' => 'img/characters/phillip-large.png'
            ],
            [
                'name' => 'Maria Pique',
                'role' => 'Educator',
                'img_small' => 'img/characters/maria-small.png',
                'img_large' => 'img/characters/maria-large.png'
            ],

        ]);
    }
}
