<?php

use Illuminate\Database\Seeder;

class VideoCallSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\characters::class, 9)->create();
        factory(App\video::class, 20)->create();
        factory(App\notes::class, 20)->create();
    }
}
