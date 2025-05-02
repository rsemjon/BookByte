<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ProfileController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\DeliveryController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ConfirmationController;

// home
Route::get('/', [ProductController::class, 'showHomeProducts'])->name('home');

// login and register
Route::get('login', [LoginController::class, 'displayLogin'])->name('display.login');
Route::get('register', [RegisterController::class, 'displayRegister'])->name('display.register');
Route::post('login', [LoginController::class, 'loginUser'])->name('login');
Route::post('register', [RegisterController::class, 'registerUser'])->name('register');
Route::post('logout', [LoginController::class, 'logoutUser'])->name('logout');

// profile
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'displayProfile'])->name('profile');
    Route::put('/profile', [ProfileController::class, 'updateProfile'])->name('profile.update');
    Route::put('/profile/password', [ProfileController::class, 'updatePassword'])->name('profile.password');
});

// products
Route::get('products', [ProductController::class, 'showAllProducts'])->name('allProducts');
Route::get('/product/{id}', [ProductController::class, 'showSpecificProduct'])->name('show.product');
Route::get('/product/edit/{id}', [ProductController::class, 'showEditSpecificProduct'])->name('show.edit.product');
Route::put('/product/edit/update/{id}', [ProductController::class, 'updateProduct'])->name('update.product');
Route::delete('/product/edit/delete/{id}', [ProductController::class, 'deleteProduct'])->name('delete.product');
Route::get('/product/add/show', [ProductController::class, 'showAddProduct'])->name('show.add.product');
Route::post('/product/add/new', [ProductController::class, 'addProduct'])->name('add.product');
Route::delete('/product/{id}/photo/delete/', [ProductController::class, 'deletePhotoOfProduct'])->name('delete.photo');

// cart
Route::get ('/cart', [CartController::class,'index' ])->name('cart');
Route::post('/cart/add/{product}', [CartController::class,'add' ])->name('cart.add');
Route::post('/cart/update/{product}', [CartController::class,'update'])->name('cart.update');
Route::post('/cart/remove/{product}', [CartController::class,'remove'])->name('cart.remove');

// delivery
Route::get ('/delivery', [DeliveryController::class,'show'])->name('delivery');
Route::post('/delivery', [DeliveryController::class,'store'])->name('delivery.store');

// payment
Route::get('/checkout/payment', [PaymentController::class, 'show'])->name('payment');
Route::post('/checkout/payment', [PaymentController::class, 'store'])->name('payment.store');

// confirmation
Route::get('/confirmation', [ConfirmationController::class, 'show'])->name('confirmation');
Route::post('/confirmation/confirm', [ConfirmationController::class, 'confirm'])->name('confirmation.confirm');
