<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException; 

class LoginController extends Controller
{
    public function displayLogin()
    {
        return view('login');
    }

    public function loginUser(Request $req)
    {
        $validated = $req->validate(
            [
                'email' => 'bail|required|email:rfc,dns',
                'password' => 'bail|required|string',
            ],
            [],
            [
                'email' => 'email address',
                'password' => 'password',
            ]
        );

        if(!Auth::attempt($validated)){
            throw ValidationException::withMessages([
                'credentials' => 'Incorrect email or password.'
            ]);
            
        }
        
        $req->session()->regenerate();
        return redirect()->route('profile');
    }

    public function logoutUser(Request $req)
    {
        Auth::logout();

        $req->session()->invalidate();
        $req->session()->regenerateToken();

        return redirect()->route('display.login');
    }   
}
