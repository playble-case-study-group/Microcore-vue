<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateVideoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('video', function (Blueprint $table) {
            $table->renameColumn('char_id', 'character_id');
            $table->integer('start_time')->change();
            $table->integer('end_time')->change();
            $table->string('video_url');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('video', function (Blueprint $table) {
            $table->renameColumn( 'character_id', 'char_id');
            $table->time('start_time')->change();
            $table->time('end_time')->change();
        });
    }
}
