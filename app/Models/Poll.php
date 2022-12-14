<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Poll extends Model
{
    use HasFactory;
    protected $table = "tb_polls";
    protected $primaryKey = "id";
    protected $fillable = [
        "title",
        "description",
        "deadline",
        "created_by",
    ];
}
