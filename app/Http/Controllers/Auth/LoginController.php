<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function displayLogin()
    {
        return view('login');
    }

    public function loginUser()
    {
        return view('login');
    }
}
