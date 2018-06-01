<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCharacterEmailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('character_email', function (Blueprint $table) {
            $table->increments('character_email_id');
            $table->string('subject');
            $table->text('body');
            $table->integer('day');
            $table->integer('character_id')->comment('which character sent it');
            $table->integer('class_id')->default(0)->comment('sends only to specific class');
            $table->integer('group_id')->default(0)->comment('sends only to specific group');
            $table->integer('user_id')->default(0)->comment('sends only to specific user');
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
        Schema::dropIfExists('character_email');
    }
}
