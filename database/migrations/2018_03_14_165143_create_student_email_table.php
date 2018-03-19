<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentEmailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_email', function (Blueprint $table) {
            $table->increments('student_email_id');
            $table->integer('user_id')->comment('which student sent it');
            $table->integer('day')->default(1);
            $table->string('subject');
            $table->text('body');
            $table->text('character_id')->comment('character to which it was sent');
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
        Schema::dropIfExists('student_email');
    }
}
