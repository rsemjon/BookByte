<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function displayProfile()
    {
        return view('profile');
    }

    // personal data 
    public function updateProfile(Request $req)
    {
        $user = $req->user();

        $data = $req->validate(
            [
                'name' => 'required|string|regex:/^[\p{L}\s\-]+$/u|max:255',
                'email' => 'required|email:rfc,dns|unique:users,email,' . $user->id,
                'last_name' => 'sometimes|nullable|string|regex:/^[\p{L}\s\-]+$/u|max:255',
                'birth_date' => 'sometimes|nullable|date|before:today',
                'phone_number' => 'sometimes|nullable|string|regex:/^\+[1-9][0-9]{7,14}$/'
            ],
            [],
            [
                'name' => 'first name',
                'last_name' => 'last name',
                'birth_date' => 'date of birth',
                'email' => 'email address',
                'phone_number' => 'phone number',
            ]
        );

        $user->update($data);

        return back()->with('status', 'Profile information updated.');
    }

    // password 
    public function updatePassword(Request $req)
    {
        $req->validate(
            [
                'password' => 'bail|required|string|min:6|confirmed',
            ],
            [],
            ['password' => 'new password']
        );

        $req->user()->update([
            'password' => Hash::make($req->password),
        ]);

        return back()->with('status', 'Password updated.');
    }
}
