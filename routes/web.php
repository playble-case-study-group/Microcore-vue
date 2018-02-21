<?php

use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/user', 'HomeController@user');
Route::post('/updateday', 'SimulationController@updateDay');
Route::get('/sim', function () {
    return DB::table('simulation')->get();
});

Route::resource('/tasks', 'TasksController');
Route::post('/tasks/complete', 'TasksController@complete');


Route::resource('/email', 'EmailController');
Route::post('/returnemails', 'EmailController@emailData');

Route::resource('/gallery', 'GalleryController');
Route::resource('/videocall', 'VideoCallController');
Route::resource('/library', 'LibraryController');




