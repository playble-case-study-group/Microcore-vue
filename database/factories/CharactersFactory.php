<?php

use Faker\Generator as Faker;

$factory->define(App\characters::class, function (Faker $faker) {
    return [
        //
        'id' => $faker->unique()->randomNumber($nbDigits = 2),
        'name' => $faker->name($gender = 'male'|'female'),
        'created_at' => $faker->dateTime($max = 'now', $timezone = null),
        'role' => $faker->jobTitle
    ];
});
