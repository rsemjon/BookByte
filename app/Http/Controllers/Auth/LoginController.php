<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 

class LoginController extends Controller
{
    public function displayLogin()
    {
        return view('login');
    }

    public function loginUser(Request $req)
    {
        $validated = $req->validate([
            'email' => 'required|email',
            'password' => 'required|String'
        ]);

        if(!Auth::attempt($validated)){
            throw ValidationException::withMessage([
                'credentials' => 'Incorrect credentials'
            ]);
            
        }
        else{
            $req->session()->regenerate();
            return redirect()->route('profile');
        }
    }

    public function logoutUser(Request $req)
    {
        Auth::logout();

        $req->session()->invalidate();
        $req->session()->regenerateToken();

        return redirect()->route('display.login');

    }
}
