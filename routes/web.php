<?php

use App\Http\Controllers\DataProviderController;
use Illuminate\Support\Facades\Route;

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
    return view('auth/login');
});
Route::get('/home', function () {
    return view('home');
});
Route::get('/register', function () {
    return view('auth/register');
});
Route::get('/login', function () {
    return view('auth/login');
});
Route::post('/update-user', [DataProviderController::class, 'updateUser']);
Route::post('/create-post', [DataProviderController::class, 'createPost']);
Route::post('/update-post', [DataProviderController::class, 'updatePost']);
Route::post('/delete-post', [DataProviderController::class, 'deletePost']);
Route::post('/show-posts', [DataProviderController::class, 'showPosts']);
Route::post('/show-friends', [DataProviderController::class, 'showFriends']);
Route::post('/add-remove-friends', [
    DataProviderController::class,
    'addremoveFriends',
]);
Route::post('/get-user', [DataProviderController::class, 'getUser']);
Route::get('/{vue_capture?}', function () {
    return redirect('/home');
})->where('vue_capture', '[\/\w\.-]*');
