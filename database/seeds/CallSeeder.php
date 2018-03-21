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
        //factory(App\characters::class, 9)->create();
        factory(App\call::class, 20)->create();
        factory(App\notes::class, 20)->create();
    }
}
