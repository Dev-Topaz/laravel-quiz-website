<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MultiResponseAnswerContent extends Model
{
    use HasFactory;

    protected $table = 'multi_response_answer_contents';
    protected $primaryKey = 'id';
    protected $fillable = ['quiz_id', 'content', 'response_id'];
}
