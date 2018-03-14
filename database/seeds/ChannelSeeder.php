<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ChannelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // this correspond to PCS_Test_1 and PCS_Test_2 in DialogFlow
        DB::table('channel')->insert([
            [ 'name' => 'Channel 1', 'channel_key' => '884bfc04fd474126993d40f682471515' ],
            [ 'name' => 'Channel 2', 'channel_key' => 'c31305b92c7443f1908e821264a193ae']
        ]);
    }
}
