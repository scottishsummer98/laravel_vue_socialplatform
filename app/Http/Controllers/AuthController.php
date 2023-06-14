<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'fname' => ['required'],
            'lname' => ['required'],
            'dob' => ['required'],
            'gender' => ['required'],
            'mobile' => ['required'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', 'min:6', 'confirmed'],
        ]);

        User::create([
            'fname' => $request->fname,
            'lname' => $request->lname,
            'dob' => $request->dob,
            'gender' => $request->gender,
            'mobile' => $request->mobile,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($request->only('email', 'password'))) {
            return response()->json(Auth::user(), 200);
        }
        throw ValidationException::withMessages([
            'email' => ['The Provided credentials are incorrect'],
        ]);
    }

    public function logout()
    {
        Auth::logout();
    }

    //Sanctum Functions
    // public  function register(Request $request)
    // {
    //     $request->validate([
    //         'fname' => ['required'],
    //         'lname' => ['required'],
    //         'dob' => ['required'],
    //         'gender' => ['required'],
    //         'mobile' => ['required'],
    //         'email' => ['required', 'email', 'unique:users'],
    //         'password' => ['required', 'min:6', 'confirmed'],
    //     ]);

    //     $user = User::create([
    //         'fname' => $request->fname,
    //         'lname' => $request->lname,
    //         'dob' => $request->dob,
    //         'gender' => $request->gender,
    //         'mobile' => $request->mobile,
    //         'email' => $request->email,
    //         'password' => Hash::make($request->password),
    //     ]);

    //     $token = $user->createToken('myapptoken')->plainTextToken;

    //     $response = [
    //         'user' => $user,
    //         'token' => $token,
    //     ];

    //     return response($response, 201);
    // }

    // public  function login(Request $request)
    // {
    //     $request->validate([
    //         'email' => ['required', 'email'],
    //         'password' => ['required'],
    //     ]);

    //     //Check Email
    //     $user = User::where('email', $request->email)->first();

    //     //Check Password
    //     if (!$user || !Hash::check($request->password, $user->password)) {
    //         return response([
    //             'message' => 'Credentials Didn\'t match!'
    //         ], 401);
    //     }

    //     $token = $user->createToken('myapptoken')->plainTextToken;

    //     $response = [
    //         'user' => $user,
    //         'token' => $token,
    //     ];

    //     return response($response, 201);
    // }

    // public function logout()
    // {
    //     auth('sanctum')->user()->tokens()->delete();
    //     return [
    //         'message' => 'Logged Out'
    //     ];
    // }
}
