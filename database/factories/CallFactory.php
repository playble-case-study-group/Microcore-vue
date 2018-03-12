<?php

use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        'day' => $faker->random.arrayElement(1,2,3)
    ];
});
