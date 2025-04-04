<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth; 

class RegisterController extends Controller
{
    public function displayRegister()
    {
        return view('register');
    }

    public function registerUser(Request $req)
    {
        $validated = $req->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'password' => 'required|string|min:7|confirmed'
        ]);

        $user = User::create($validated);
        Auth::login($user);

        return redirect()->route('display.login');
    }
}
