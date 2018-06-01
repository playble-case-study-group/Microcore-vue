<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Truncate character_email table
        DB::table('character_email')->truncate();

        // Character emails day 1
        DB::table('character_email')->insert([
            [
                'subject' => 'Day 1 Character 1',
                'body' => 'This email is from the first character on the first day',
                'day' => 1,
                'character_id' => 1,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ],
            [
                'subject' => 'Day 1 Character 2',
                'body' => 'This email is from the second character on the first day',
                'day' => 1,
                'character_id' => 2,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ],
            [
                'subject' => 'Day 1 Character 3',
                'body' => 'This email is from the third character on the first day',
                'day' => 1,
                'character_id' => 3,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ]
        ]);


        // Character emails day 2
        DB::table('character_email')->insert([
            [
                'subject' => 'Day 2 Character 1',
                'body' => 'This email is from the first character on the second day',
                'day' => 2,
                'character_id' => 1,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ],
            [
                'subject' => 'Day 2 Character 2',
                'body' => 'This email is from the second character on the second day',
                'day' => 2,
                'character_id' => 2,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ],
            [
                'subject' => 'Day 2 Character 3',
                'body' => 'This email is from the third character on the second day',
                'day' => 2,
                'character_id' => 3,
                'class_id' => 0,
                'group_id' => 0,
                'user_id' => 0,
                'created_at' => DB::raw('NOW()')
            ]
        ]);

    }
}
