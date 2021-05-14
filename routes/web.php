<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\QuizController;

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

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
//Route::get('/initial_roles', [App\Http\Controllers\PermissionController::class, 'Permission']);
Route::group(['middleware' => 'role:manager'], function() {

   Route::get('/admin', function() {

      return 'Welcome Admin';

   });

    Route::get('/quizes/{quiz_type}/exam/{exam}', [QuizController::class, 'create']);
    Route::get('/quizes/{quiz}', [QuizController::class, 'show']);
    Route::post('/quizes', [QuizController::class, 'store']);
    Route::post('/update_theme_style', [QuizController::class, 'update_theme_style']);
    Route::get('/quizes/{quiz}/edit', [QuizController::class, 'edit']);
//    Route::get('/quizes_form_view/{quiz}/edit', [QuizController::class, 'edit_form_view']);
//    Route::get('/quizes_slide_view/{quiz}/edit', [QuizController::class, 'edit_slide_view']);
    Route::put('/quizes/{quiz}', [QuizController::class, 'update']);
    Route::delete('/quizes/{quiz}', [QuizController::class, 'destroy']);
});

Route::resource('users', UserController::class);
Route::resource('exams', ExamController::class);

