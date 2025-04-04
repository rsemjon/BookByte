<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('login', [LoginController::class, 'displayLogin'])->name('display.login');
Route::get('register', [RegisterController::class, 'displayRegister'])->name('display.register');
Route::post('login', [LoginController::class, 'loginUser'])->name('login');
Route::post('register', [RegisterController::class, 'registerUser'])->name('register');
Route::post('logout', [LoginController::class, 'logoutUser'])->name('logout');
Route::view('profile', 'profile')->name('profile');

Route::get('/profile', function () {
    return view('profile'); 
})->middleware('auth')->name('profile');

