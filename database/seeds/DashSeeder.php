<?php

use Illuminate\Database\Seeder;

class DashSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('dashboard')->insert([
            [
                'day' => 1,
                'day_video' => '/video/fun.mp4',
                'news_headline' => 'Microcore on Top',
                'news_snippet' => 'New life saving drug to hit the market soon!',
                'stock_value' => 2.50,
                'stock_percentage' => 5,
                'stock_status' => 'up',
                'message_count' => 2,
                'email_count' => 1
            ],
            [
                'day' => 2,
                'day_video' => '/video/me.mp4',
                'news_headline' => 'Microcore has Micro-meltdown',
                'news_snippet' => 'Pig explodes on lab grounds. ',
                'stock_value' => 3.12,
                'stock_percentage' => 12,
                'stock_status' => 'down',
                'message_count' => 3,
                'email_count' => 2
            ],
            [
                'day' => 3,
                'day_video' => '/video/test.mp4',
                'news_headline' => 'What will happen to Microcore?',
                'news_snippet' => 'After the pig mess, what is next?',
                'stock_value' => -1.20,
                'stock_percentage' => 2,
                'stock_status' => 'up',
                'message_count' => 1,
                'email_count' => 3
            ]
        ]);
    }
}
