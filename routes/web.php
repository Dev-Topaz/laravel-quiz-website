<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\PreviewController;
use App\Http\Controllers\ExamGroupController;
use App\Http\Controllers\SendMailController;

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

Route::get('/', [ExamController::class, 'index']);

Auth::routes();

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
//Route::get('/initial_roles', [App\Http\Controllers\PermissionController::class, 'Permission']);
Route::group(['middleware' => 'role:manager'], function () {

    Route::get('/admin', function () {

        return 'Welcome Admin';

    });

    Route::get('/quizes/{quiz_type}/exam/{exam}', [QuizController::class, 'create']);
    Route::get('/quizes/{quiz}', [QuizController::class, 'show']);
    Route::post('/hotspots_image_upload', [QuizController::class, 'hotspots_image_upload']);
    Route::post('/update_quiz_index', [QuizController::class, 'update_quiz_index']);
    Route::post('/duplicate_quiz', [QuizController::class, 'duplicate_quiz']);
    Route::post('/quizes', [QuizController::class, 'store']);
    Route::post('/update_theme_style', [QuizController::class, 'update_theme_style']);
    Route::get('/quizes/{quiz}/edit', [QuizController::class, 'edit']);
    Route::put('/quizes/{quiz}', [QuizController::class, 'update']);
    Route::delete('/quizes/{quiz}', [QuizController::class, 'destroy']);
    Route::post('/upload_audio', [UploadController::class, 'upload_audio']);
    Route::post('/upload_video', [UploadController::class, 'upload_video']);
    Route::post('/add_exam_group', [ExamGroupController::class, 'default_store']);
    Route::delete('/exam_groups/{exam_group}', [ExamGroupController::class, 'destroy']);
});

Route::get('/preview_slide/{id}', [PreviewController::class, 'preview_slide']);
Route::get('/preview_group/{id}', [PreviewController::class, 'preview_group']);
Route::get('/preview_exam/{id}', [PreviewController::class, 'preview_exam']);


Route::resource('users', UserController::class);
Route::resource('exams', ExamController::class);

Route::post('/send-mail', [SendMailController::class, 'send_mail'])->name('send-mail');

