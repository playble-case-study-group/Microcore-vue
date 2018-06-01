<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DashboardMaster extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::dropIfExists('dashboard');
        Schema::create('notes', function (Blueprint $table) {
            $table->increments('dash_id');
            $table->timestamps();
            $table->integer('day');
            $table->text('day_video');
            $table->text('news_headline');
            $table->text('news_snippet');
            $table->double('stock_value');
            $table->integer('stock_pergentage');
            $table->text('stock_status');
            $table->integer('message_count')->default(0);
            $table->integer('email_count')->default(0);
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
        Schema::dropIfExists('dashboard');
    }
}
