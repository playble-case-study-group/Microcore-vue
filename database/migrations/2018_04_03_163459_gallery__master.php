<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class GalleryMaster extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('gallery');
        Schema::create('gallery', function (Blueprint $table) {
            $table->increments('gallery_id');
            $table->string('title');
            $table->text('description');
            $table->string('image');
            $table->timestamps();

        });

        Schema::dropIfExists('student_gallery');
        Schema::create('student_gallery', function (Blueprint $table) {
            $table->increments('student_gallery_id');
            $table->integer('gallery_id');
            $table->string('title');
            $table->text('description');
            $table->string('img');
            $table->integer('user_id')->comment('Id of user who edited the item.');
            $table->integer('group_id')->default(0);
            $table->integer('class_id')->default(0);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('gallery');
        Schema::dropIfExists('student_gallery');
    }
}
