<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FinalWikiMigration extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::dropIfExists('wiki');
        Schema::create('wiki', function (Blueprint $table) {
            $table->increments('wiki_id');
            $table->integer('lang_1_ar');
            $table->integer('lang_2_ar');

        });

        Schema::dropIfExists('article');
        Schema::create('article', function (Blueprint $table) {
            $table->increments('article_id');
            $table->integer('lang_id');
            $table->string('title');
            $table->text('content');
            $table->timestamps();

        });
        Schema::dropIfExists('languages');
        Schema::create('languages', function (Blueprint $table) {
            $table->increments('lang_id');
            $table->string('language');

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
        Schema::dropIfExists('wiki');
        Schema::dropIfExists('article');
        Schema::dropIfExists('languages');

    }
}
