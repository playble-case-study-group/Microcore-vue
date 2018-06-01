<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClassSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('class')->truncate();

        DB::table('class')
            ->insert([
                [
                    'class_id' => 1,
                    'name' => 'Test Class 1',
                    'key' => 'test_class_1',
                    'created_at' => DB::raw('NOW()')
                ],
                [
                    'class_id' => 2,
                    'name' => 'Test Class 2',
                    'key' => 'test_class_2',
                    'created_at' => DB::raw('NOW()')
                ]
            ]);
    }
}
