<?php

use Faker\Generator as Faker;

$factory->define(App\videocall::class, function (Faker $faker) {
    return [
        //
        'id' => $faker->unique()->randomDigitNotNull,
        'character_id' => $faker->randomDigitNotNull,
        'day' => $faker->randomElement($array = array('1', '2', '3')),
        'video_starttime' => $faker->randomNumber($nbDigits = 2, $strict = true),
        'video_endtime' => $faker->randomNumber($nbDigits = 3, $strict = true),
        'created' => $faker->dateTime($max = 'now', $timezone = null),
        'modified' => $faker->dateTime($max = 'now', $timezone = null),
        'video' => $faker->randomElement($array = array('/video/fun.mp4', '/video/junk.mp4', '/video/test.mp4', '/video/me.mp4', '/video/you.mp4')),
        'question' => $faker->text($maxNbChars = 50)
    ];
});
