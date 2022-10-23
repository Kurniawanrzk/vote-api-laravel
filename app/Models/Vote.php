<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    use HasFactory;
    protected $table = "tb_votes";
    protected $primaryKey = "id";
    protected $fillable = [
        "choice_id",
        "user_id",
        "poll_id",
        "divisions_id"
    ];
}
