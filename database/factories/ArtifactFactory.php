<?php

use Faker\Generator as Faker;

$factory->define(App\artifacts::class, function (Faker $faker) {
    return [
        //
        'title' => $faker->sentence($nbWords = 4, $variableNbWords = true),
        'description' => $faker->text($maxNbChars = 50),
        'image' => $faker->imageUrl($width = 640, $height = 480),

    ];
});
