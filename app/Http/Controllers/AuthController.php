<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{Validator, Hash};

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    public function login(Request $req)
    {
        $validator = Validator::make($req->all(), [
            "username" => "required",
            "password" => "required"
        ]);

        if($validator->fails()) {
            return response()->json([
                "message" => "please input the username and password",
                "status" => false
            ], 401);
        }

        if(!$token = auth()->attempt(
            [
                "username" => $req->username,
                "password" => $req->password
                ]
            )) {
                return response()->json([
                    "error" => "Unauthorized"
                ], 401);
            }

            return response()->json([
                "access_token" => $token,
                "token_type" => "Bearer",
                "expires_in" => "1440"
            ], 200);
    }

    public function logout()
    {
        auth()->logout();   
        return response()->json([
            "message" => "successfully logged out",
            "status" => true
        ], 200);
    }

    public function me()
    {
        return auth()->user();
    }

    public function reset_password(Request $req)
    {
        $validator = Validator::make($req->all(), [
            "old_password" => "required",
            "new_password" => "required"
        ]);

        if($validator->fails())
        {
            return response()->json([
                "message" => "please input the old_password and the new_password",
                "status" => false
            ], 401);
        }

        $user = auth()->user();

        if(!Hash::check($req->old_password, $user->password)) {
            return response()->json([
                "message" => "old_password did not match",
                "status" => false
            ], 422);
        }

        $user->update([
            "password" => bcrypt($req->new_password)
        ]);

        return response()->json([
            "message" => "reset success, user logged out",
            "status" => true,
            auth()->logout()
        ], 200);
    }
}
