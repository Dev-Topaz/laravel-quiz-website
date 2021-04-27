<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MultiChoiceAnswerContent extends Model
{
    use HasFactory;

    protected $table = 'multi_choice_answer_contents';
    protected $primaryKey = 'id';
    protected $fillable = ['quiz_id', 'content', 'choice_id'];
}
