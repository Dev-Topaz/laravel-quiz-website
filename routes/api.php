<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\ExamController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [RegisterController::class, 'login']);

Route::middleware('auth:api')->get('/get_downloading_quizzes_index', [ExamController::class, 'get_downloading_quizzes_index']);
Route::middleware('auth:api')->get('/get_all_index', [ExamController::class, 'get_all_index']);
Route::middleware('auth:api')->get('/get_quiz/{id}', [ExamController::class, 'get_quiz']);
Route::middleware('auth:api')->get('/get_quiz_assets_url/{id}', [ExamController::class, 'get_quiz_assets_url']);
Route::middleware('auth:api')->get('/get_quiz_html/{id}', [ExamController::class, 'get_quiz_html']);

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
