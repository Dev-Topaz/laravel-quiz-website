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

        return view('preview', ['quizzes' => $quizzes]);
    }
}
