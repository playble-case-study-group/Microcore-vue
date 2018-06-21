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

// Home
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/user', 'HomeController@user');


Route::group(['middleware'=>['auth', 'admin']], function() {
    //Library
    Route::resource('/editor', 'ArticleEditorController');
    Route::post('/deleteArticle', 'ArticleEditorController@deleteArticle');
    Route::post('/addArticle', 'ArticleEditorController@addArticle');
<<<<<<< HEAD
});


Route::group(['middleware'=>['auth', 'instructor']], function() {
    // Class
    Route::resource('/classes', 'ClassController');
    Route::resource('/assignments', 'AssignmentController');
    Route::post('/retrieveassignments', 'AssignmentController@retrieveAssignments');
=======
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
});


Route::group(['middleware'=>['auth', 'instructor']], function() {
    // Class
    Route::resource('/classes', 'ClassController');
    Route::resource('/assignments', 'AssignmentController');
    Route::post('/retrieveassignments', 'AssignmentController@retrieveAssignments');
});



Route::group(['middleware'=>['auth', 'student']], function() {
    // Simulation
    Route::post('/updateday', 'SimulationController@updateDay');
    Route::get('/sim', function () {
        return DB::table('simulation')->get();
    });
    Route::post( '/resetDay', 'SimulationController@resetDay' );
    Route::post('/getemailnotifications', 'SimulationController@getEmailNotifications');
    Route::post('/getgallerynotifications', 'SimulationController@getGalleryNotifications');
    Route::post('/visitedgallery', 'SimulationController@visitedGallery');

<<<<<<< HEAD
Route::group(['middleware'=>['auth', 'student']], function() {
    // Simulation
    Route::post('/updateday', 'SimulationController@updateDay');
    Route::get('/sim', function () {
        return DB::table('simulation')->get();
    });
    Route::post( '/resetDay', 'SimulationController@resetDay' );
    Route::post('/getemailnotifications', 'SimulationController@getEmailNotifications');
    Route::post('/getgallerynotifications', 'SimulationController@getGalleryNotifications');
    Route::post('/visitedgallery', 'SimulationController@visitedGallery');
    Route::post('/getvideocallnotifications', 'SimulationController@getVideoCallNotifications');



// Tasks
    Route::resource('/tasks', 'TasksController');
    Route::post('/tasks/complete', 'TasksController@complete');

// Email
    Route::resource('/email', 'EmailController');
    Route::post('/returnemails', 'EmailController@emailData');
    Route::post('/readEmail', 'EmailController@readEmail');

// Video Call
    Route::resource('/videocall', 'VideoCallController');
    Route::post('/saveFile', 'VideoCallController@saveFile');
    Route::post('/clickedQuestion', 'VideoCallController@disableQuestion');

=======

// Tasks
    Route::resource('/tasks', 'TasksController');
    Route::post('/tasks/complete', 'TasksController@complete');

// Email
    Route::resource('/email', 'EmailController');
    Route::post('/returnemails', 'EmailController@emailData');
    Route::post('/readEmail', 'EmailController@readEmail');

// Video Call
    Route::resource('/videocall', 'VideoCallController');
    Route::post('/saveFile', 'VideoCallController@saveFile');
    Route::post('/clickedQuestion', 'VideoCallController@disableQuestion');

>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
// Library
    Route::resource('/library', 'LibraryController');
// Route::post('/updateArticle', 'ArticleEditorController@update');

// Chat
    Route::resource('/chat', 'ChatController');
    Route::get('/chatbot', function () {
        return view('chatbot');
    });

// Gallery
<<<<<<< HEAD
    //Route::get( '/getartifacts', 'GalleryController@getArtifacts' );
    //Route::resource('/gallery', 'GalleryController');
=======
    Route::get( '/getartifacts', 'GalleryController@getArtifacts' );
    Route::resource('/gallery', 'GalleryController');
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

// Group
    Route::resource('/group', 'GroupController');
    Route::post('/addToGroup', 'GroupController@addToGroup');
    Route::post('removeFromGroup', 'GroupController@removeFromGroup');


// Dash
    Route::get('/dashboard', 'DashController@loadDash');
});

<<<<<<< HEAD
//About
    Route::get('/about', 'AboutController@index');

//Characters
    Route::get('/team', 'CharactersController@index');

//Clickable Map
    Route::get('/scene', 'MapController@index');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
=======
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

