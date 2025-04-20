<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;


Route::get('/', [ProductController::class, 'showHomeProducts'])->name('home');

Route::get('login', [LoginController::class, 'displayLogin'])->name('display.login');
Route::get('register', [RegisterController::class, 'displayRegister'])->name('display.register');
Route::post('login', [LoginController::class, 'loginUser'])->name('login');
Route::post('register', [RegisterController::class, 'registerUser'])->name('register');
Route::post('logout', [LoginController::class, 'logoutUser'])->name('logout');

//Route::view('profile', 'profile')->name('profile');
Route::get('/profile', function () {
    return view('profile'); 
})->middleware('auth')->name('profile');

Route::get('products', [ProductController::class, 'showAllProducts'])->name('allProducts');
Route::get('/product/{id}', [ProductController::class, 'showSpecificProduct'])->name('show.product');

Route::get ('/cart', [CartController::class,'index' ])->name('cart');
Route::post('/cart/add/{product}', [CartController::class,'add'   ])->name('cart.add');
Route::post('/cart/update/{product}', [CartController::class,'update'])->name('cart.update');
Route::post('/cart/remove/{product}', [CartController::class,'remove'])->name('cart.remove');


