<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamGroup extends Model
{
    use HasFactory;

    protected $table = 'exam_groups';
    protected $primaryKey = 'id';
    protected $fillable = ['group_name', 'exam_id'];
}
