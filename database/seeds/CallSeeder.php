<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Generator as Faker;

class CallSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker $faker)
    {
        // Calls
        DB::table('call')->insert([
            [
                'day' => 1,
                'character_id' => 1,
                'call_url' => '/calls/call_11.mp4',
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'day' => 1,
                'character_id' => 2,
                'call_url' => '/calls/call_12.mp4',
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'day' => 2,
                'character_id' => 1,
                'call_url' => '/calls/call_21.mp4',
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'day' => 2,
                'character_id' => 2,
                'call_url' => '/calls/call_22.mp4',
                'created_at' => \Carbon\Carbon::now()
            ]
        ]);

        //  Call_id may not work out on this one if you run it a second time.
        // Questions
        DB::table('question')->insert([
            // Day 1 Call 1
            [
                'call_id' => 1,
                'question' => 'Day 1, call 1, question 1',
                'start_time' => 20,
                'end_time' => 30,
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'call_id' => 1,
                'question' => 'Day 1, call 1, question 2',
                'start_time' => 35,
                'end_time' => 50,
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'call_id' => 1,
                'question' => 'Day 1, call 1, question 3',
                'start_time' => 55,
                'end_time' => 80,
                'created_at' => \Carbon\Carbon::now()
            ],
            // Day 1 Call 2
            [
                'call_id' => 2,
                'question' => 'Day 1, call 2, question 1',
                'start_time' => 20,
                'end_time' => 30,
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'call_id' => 2,
                'question' => 'Day 1, call 2, question 2',
                'start_time' => 60,
                'end_time' => 80,
                'created_at' => \Carbon\Carbon::now()
            ],
            // Day 2 Call 1
            [
                'call_id' => 3,
                'question' => 'Day 2, call 1, question 1',
                'start_time' => 10,
                'end_time' => 30,
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'call_id' => 3,
                'question' => 'Day 2, call 1, question 2',
                'start_time' => 45,
                'end_time' => 70,
                'created_at' => \Carbon\Carbon::now()
            ],
            // Day 2 Call 2
            [
                'call_id' => 4,
                'question' => 'Day 2, call 2, question 1',
                'start_time' => 10,
                'end_time' => 40,
                'created_at' => \Carbon\Carbon::now()
            ],
            [
                'call_id' => 4,
                'question' => 'Day 2, call 2, question 2',
                'start_time' => 41,
                'end_time' => 50,
                'created_at' => \Carbon\Carbon::now()
            ],
        ]);
    }
}
