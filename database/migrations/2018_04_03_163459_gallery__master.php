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

        Schema::dropIfExists('tag');
        Schema::create('tag', function (Blueprint $table) {
            $table->increments('tag_id');
            $table->string('title');
        });

        Schema::dropIfExists('gallery_has_tag');
        Schema::create('gallery_has_tag', function (Blueprint $table) {
            $table->integer('gallery_id');
            $table->integer('tag_id');
        });

//        Schema::dropIfExists('student_gallery_has_tag');
//        Schema::create('student_gallery_has_tag', function (Blueprint $table) {
//            $table->integer('')
//        });
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
        Schema::dropIfExists('tag');
        Schema::dropIfExists('gallery_has_tag');
    }
}
