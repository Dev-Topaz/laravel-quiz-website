<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    use HasFactory;

    protected $table = 'exams';
    protected $primaryKey = 'id';
    protected $fillable = ['name', 'description', 'author_id', 'attempt_number', 'status', 'passing_score', 'screen_height', 'screen_width'];

    public function exam_groups()
    {
        return $this->hasMany(ExamGroup::class, 'exam_id', 'id');
    }
}
