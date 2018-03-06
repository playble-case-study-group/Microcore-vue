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
        factory(App\videocall::class, 20)->create();
        factory(App\notes::class, 20)->create();
        factory(App\characters::class, 9)->create();
    }
}
