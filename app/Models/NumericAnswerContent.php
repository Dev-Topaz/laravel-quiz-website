<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NumericAnswerContent extends Model
{
    use HasFactory;

    protected $table = 'numeric_answer_contents';
    protected $primaryKey = 'id';
    protected $fillable = ['quiz_id', 'option_value', 'input_value_1', 'input_value_2'];
}
