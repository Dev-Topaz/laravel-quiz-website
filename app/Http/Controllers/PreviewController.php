<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
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

        foreach ($quizzes as $quiz) {
            echo $quiz->exam_group->exam->theme_style;
        }

        return view('preview', ['quizzes' => $quizzes]);
    }
}
