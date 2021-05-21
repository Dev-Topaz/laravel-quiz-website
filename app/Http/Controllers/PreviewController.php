<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use App\Models\Exam;
use App\Models\ExamGroup;
use Illuminate\Http\Request;

class PreviewController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index() {
        return view('preview');
    }

    public function preview_slide(string $id) {
        $quizzes = Quiz::where('id', $id)->get();

        return view('preview', ['quizzes' => $quizzes]);
    }


    public function preview_group(string $id) {
        $exam_groups = ExamGroup::where('id', $id)->get();

        $quizzes = [];
        foreach ($exam_groups as $exam_group) {
            foreach ($exam_group->quizes as $quiz) {
                array_push($quizzes, $quiz);
            }
        }

        return view('preview', ['quizzes' => $quizzes]);
    }

    public function preview_exam(string $id) {
        $exams = Exam::where('id', $id)->get();

        $exam_groups = $exams[0]->exam_groups;
        $quizzes = [];
        foreach ($exam_groups as $exam_group) {
            foreach ($exam_group->quizes as $quiz) {
                array_push($quizzes, $quiz);
            }
        }

        return view('preview', ['quizzes' => $quizzes]);
    }
}
