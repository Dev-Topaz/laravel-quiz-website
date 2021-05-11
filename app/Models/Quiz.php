<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;

    protected $table = 'quizes';
    protected $primaryKey = 'id';
    protected $fillable = ['exam_group_id', 'type_id', 'question_element', 'answer', 'feedback_correct', 'feedback_incorrect', 'feedback_try_again', 'media'];

    public function Quiz_type()
    {
        return $this->belongsTo(QuizType::class, 'type_id', 'id');
    }

}
