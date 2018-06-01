<?php

use Faker\Generator as Faker;
use Illuminate\Support\Facades\DB;

$factory->define(App\video::class, function (Faker $faker) {
    $character_ids = App\characters::pluck('id');
    return [
        //
        'video_id' => $faker->unique()->randomNumber($nbDigits = 2),
        'character_id' => $character_ids->random(),
        'day' => $faker->randomElement($array = array('1', '2', '3')),
        'video_url' => $faker->randomElement($array = array('/video/fun.mp4', '/video/junk.mp4', '/video/test.mp4', '/video/me.mp4', '/video/you.mp4')),
    ];
});
