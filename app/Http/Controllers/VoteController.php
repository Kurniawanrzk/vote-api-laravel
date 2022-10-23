<?php

namespace App\Http\Controllers;

use App\Models\{Vote, Poll, Choice};
use Illuminate\Http\Request;

class VoteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    public function create(Request $req, $poll_id, $choice_id)
    {   
        
        if(auth()->user()->role === "admin") {
            return response()->json([
                "message" => "Unauthorized"
            ], 401);        
        } else if(empty(Poll::where("id", $poll_id)->first()) || empty(Choice::where("id", $choice_id)->first())) {
            return response()->json([
                "message" => "invalid choice"
            ], 422);   
        } else if(!empty(Vote::where("poll_id", $poll_id)->first()) || !empty(Vote::where("choice_id", $choice_id)->first())) {
            return response()->json([
                "message" => "already voted"
            ], 422);   
        } else if(Poll::where("id", $poll_id)->first()->deadline < date("Y-m-d h:m:s")) {
            return response()->json([
                "message" => "voting deadline"
            ], 422);   
        }

        $vote = new Vote;
        $vote->
        create([
            "choice_id" => $choice_id,
            "user_id" => auth()->user()->id,
            "poll_id" => $poll_id,
            "divisions_id" => auth()->user()->division_id
        ])
        ->save();
        return response()->json([
            "message" => "voting success"
        ], 200); 

    }
}
