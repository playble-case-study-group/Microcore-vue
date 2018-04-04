<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class VideoCallMaster extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::dropIfExists('notes');
        Schema::create('notes', function (Blueprint $table) {
            $table->increments('notes_id');
            $table->timestamps();
            $table->text('note');
            $table->integer('user_id');
        });

        Schema::dropIfExists('video');
        Schema::create('video', function (Blueprint $table) {
            $table->increments('video_id');
            $table->integer('character_id');
            $table->integer('day');
            $table->string('video_url');
            $table->timestamps();
        });

        Schema::dropIfExists('question');
        Schema::create('question', function (Blueprint $table) {
            $table->increments('question_id');
            $table->integer('call_id');
            $table->string('question');
            $table->integer('start_time');
            $table->integer('end_time');
            $table->timestamps();
        });

        Schema::dropIfExists('student_video_submissions');
        Schema::create('student_video_submissions', function (Blueprint $table) {
            $table->increments('submission_id');
            $table->string('submission_url');
            $table->integer('submission_day');
            $table->integer('character_id');
            $table->integer('user_id');
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('video');
        Schema::dropIfExists('notes');
        Schema::dropIfExists('question');
        Schema::dropIfExists('student_video_submissions');
    }
}
