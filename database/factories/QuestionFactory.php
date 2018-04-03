<?php

use Faker\Generator as Faker;

$factory->define(App\question::class, function (Faker $faker) {
    $video_ids = App\video::pluck('video_id');
    return [
        //
        'question_id' => $faker->unique()->randomNumber($nbDigits = 2),
        'call_id' => $video_ids->random(),
        'created_at' => $faker->dateTime($max = 'now', $timezone = null),
        'start_time' => $faker->randomNumber($nbDigits = 2, $strict = true),
        'end_time' => $faker->randomNumber($nbDigits = 3, $strict = true),
        'question' => $faker->text($maxNbChars = 50)
    ];
});

