<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Choice extends Model
{
    use HasFactory;
    protected $table = "tb_choices";
    protected $primaryKey = "id";
    protected $fillable = [
        "choice",
        "poll_id",
    ];
}
