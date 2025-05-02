<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function displayRegister()
    {
        return view('register');
    }

    public function registerUser(Request $req)
    {
        $req->validate(
            [
                'name' => 'required|string|regex:/^[\p{L}\s\-]+$/u|max:255',
                'email' => 'bail|required|email:rfc,dns|unique:users,email',
                'password' => 'bail|required|string|min:6|confirmed',
            ],
            [
                'password.confirmed' => 'The password confirmation does not match.',
            ],
            [
                'name' => 'first name',
                'email' => 'email address',
                'password' => 'password',
            ]
        );

        $user = User::create([
            'name' => $req->name,
            'email' => $req->email,
            'password' => bcrypt($req->password),
        ]);

        Auth::login($user);

        return redirect()->route('display.login');
    }
}
