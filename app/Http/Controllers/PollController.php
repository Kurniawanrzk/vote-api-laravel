<?php
namespace App\Http\Controllers;
use App\Models\{Poll, Choice, Vote, User};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{Validator};

class PollController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    public function create(Request $req)
    {
        $validator = Validator::make($req->all(), [
            "title" => "required",
            "description" => "required",
            "deadline" => "required",
            "choice" => "required"
        ]);

        if($validator->fails()) 
        {
            return response()->json([
                "message" => "please input title, description, deadline and choice",
                "status" => false
            ], 401);
        }

        // Convert String choices to Array
        $choices = explode(',', $req->choice);

        $poll = new Poll;
        $choice = new Choice;

        // If Choices Not more than 1 
        if(empty($choices[1])) {
            return response()->json([
                "message" => "please input more than two choices",
                "status" => false
            ], 401);        
        }

        // If User Not Admin
        if(auth()->user()->role !== "admin") 
        {
            return response()->json([
                "message" => "Unauthorized",
            ], 401);
        }

        if(!empty(Poll::where("title", $req->title)->first())) {
            return response()->json([
                "message" => "this poll already exist",
                "status" => false
            ], 401);
        }

        $poll
        ->create([
            "title" => $req->title,
            "description" => $req->description,
            "deadline" => $req->deadline,
            "created_by" => auth()->user()->id
        ])
        ->save();

        for($i = 0; $i < count($choices); $i++) {
            $choice
            ->create([
                "choice" => $choices[$i],
                "poll_id" => Poll::where("title", $req->title)
                ->first()->id,
            ])
            ->save();
        }

        return response()->json(Poll::where("title", $req->title)->first(), 200);
    }

    public function all()
    {
        if(auth()->user()->role !== "admin") 
        {
            $all = Vote::where("user_id", auth()->user()->id)->get();
            return response()->json([
                "voted" => $all->map(function($row){
                    return [
                        "id" => Poll::where("id", $row->poll_id)->first()->id,
                        "title" =>  Poll::where("id", $row->poll_id)->first()->title,
                        "description" =>  Poll::where("id", $row->poll_id)->first()->description,
                        "deadline" =>  Poll::where("id", $row->poll_id)->first()->deadline,
                        "created_by" =>  Poll::where("id", $row->poll_id)->first()->created_by,
                        "created_at" =>  Poll::where("id", $row->poll_id)->first()->created_at,
                        "creator" => User::where("id",  Poll::where("id", $row->poll_id)->first()->created_by)->first()->username,
                        "result" => Choice::where("poll_id", $row->poll_id)->get()->map(function($row) {
                            return [
                                "choice_id" => $row->id,
                                "choice" => $row->choice,
                                "point" => Vote::where("choice_id", $row->id)->count()
                            ];
                        }),

                    ];
                }),

                "exceeds_deadline" => Poll::where("deadline", "<" ,date("Y-m-d h:m:s"))->get()->map(function($row) {
                    return [
                        "id" => $row->id,
                        "title" => $row->title,
                        "description" => $row->description,
                        "deadline" => $row->deadline,
                        "created_by" => $row->created_by,
                        "created_at" => $row->created_at,
                        "creator" => User::where("id", $row->created_by)->first()->username,
                        "result" => Choice::where("poll_id", $row->id)->get()->map(function($row) {
                            return [
                                "choice_id" => $row->id,
                                "choice" => $row->choice,
                                "point" => Vote::where("choice_id", "$row->id")->count()
                            ];
                        })
                     ];
                }),
            ]);

            
            
        } else if(auth()->user()->role === "admin")
        {
            $all = Poll::all();
            return response()->json($all->map(function($row) {
                return [    
                    "id" => $row->id,
                    "title" => $row->title,
                    "description" => $row->description,
                    "deadline" => $row->deadline,
                    "created_by" => $row->created_by,
                    "created_at" => $row->created_at,
                    "creator" => User::where("id", $row->created_by)->first()->username,
                    "result" => Choice::where("poll_id", $row->id)->get()->map(function($row) {
                            return [
                                "choice_id" => $row->id,
                                "choice" => $row->choice,
                                "point" => Vote::where("choice_id", $row->id)->count()
                            ];
                        }),
                ];
            }), 200);
        } else {
            return response("null", 401);
        }

       
    }

    public function getById($poll_id)
    {
        if(auth()->user()->role !== "admin") 
        {   
            if(!empty($id = Poll::where("id", $poll_id )->first())) {
            if(
                !empty(Vote::where("poll_id", $poll_id)->first()) && !empty(Vote::where("user_id", auth()->user()->id)->first()) ||
                $id->deadline < date("Y-m-d h:m:s")
            ){
                return Poll::findOrFail($poll_id);
            }else {
                return response("null", 401);
            }
        }
        } else if(auth()->user()->role === "admin")
        {
        $poll = Poll::findOrFail($poll_id);
        return response()->json([
                "id" => $poll->id,
                "title" => $poll->title,
                "deadline" => $poll->deadline,
                "created_by" => $poll->created_by,
                "created_at" => $poll->created_at,
                "creator" => User::where("id", $poll->created_by)->first()->username,
                "result" => Choice::where("poll_id", $poll_id)->get()->map(function($row) {
                        return [
                            "choice_id" => $row->id,
                            "choice" => $row->choice,
                            "point" => Vote::where("choice_id", $row->id)->count()
                        ];
                    }),
        ], 200);
        }
    }
    public function delete($id)
    {
        Poll::destroy($id);
        return response(200);
    }

}
