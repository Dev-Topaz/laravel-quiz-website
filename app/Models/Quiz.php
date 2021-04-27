<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;

    protected $table = 'quizes';
    protected $primaryKey = 'id';
    protected $fillable = ['exam_id', 'layout', 'type_id', 'question', 'answer', 'feedback_correct', 'feedback_incorrect', 'feedback_try_again', 'is_draft', 'is_feedback', 'media'];

    public function Quiz_type()
    {
        return $this->belongsTo(QuizType::class, 'type_id', 'id');
    }

    public function multi_choice_answer_contents()
    {
        return $this->hasMany(MultiChoiceAnswerContent::class, 'quiz_id', 'id');
    }
}
