<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('login', [LoginController::class, 'showLogin'])->name('login');

Route::get('register', [RegisterController::class, 'showRegister'])->name('register');

