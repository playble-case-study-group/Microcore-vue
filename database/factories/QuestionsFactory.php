<?php

use Faker\Generator as Faker;

$factory->define(App\notes::class, function (Faker $faker) {
    $call_ids = App\call::pluck('id');
    return [
        //
        'id' => $faker->unique()->randomNumber($nbDigits = 2),
        'call_id' => $faker->$call_ids->random(),
        'question' => $faker->text($maxNbChars = 40),
        'start_time' => $faker->randomElement($array = array('0', '30')),
        'end_time' => $faker->randomElement($array = array('30', '60')),
        'created_at' => $faker->dateTime($max = 'now', $timezone = null),
    ];
});
