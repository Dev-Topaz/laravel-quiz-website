<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;

    protected $table = 'quiz_type';
    protected $primaryKey = 'id';
    protected $fillable = ['exam_id', 'layout', 'type_id', 'question', 'answer', 'feedback_correct', 'feedback_incorrect', 'feedback_try_again', 'is_feedback', 'is_draft', 'media'];
}
