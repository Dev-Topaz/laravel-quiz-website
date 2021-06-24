<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use App\Models\Exam;
use App\Models\ExamGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Validator;

class PreviewController extends Controller
{
//    public function __construct()
//    {
//        $this->middleware('auth');
//    }

    public function index() {
        return view('preview');
    }

    public function preview_slide(string $id) {
        $quizzes = Quiz::where('id', $id)->get();
        $user = Auth::user();
        $is_quiz = 0;

        return view('preview', ['quizzes' => $quizzes, 'user' => $user, 'is_quiz' => $is_quiz]);
    }


    public function preview_group(string $id) {
        $user = Auth::user();
        $exam_groups = ExamGroup::where('id', $id)->get();
        $is_quiz = 0;

        $quizzes = [];
        foreach ($exam_groups as $exam_group) {
            foreach ($exam_group->quizes as $quiz) {
                array_push($quizzes, $quiz);
            }
        }

        return view('preview', ['quizzes' => $quizzes, 'user' => $user, 'is_quiz' => $is_quiz]);
    }

    public function preview_exam(string $id) {
        if(isset(Auth::user()->id)) {
            $user = Auth::user();
            $name = $user->name;
            $email = $user->email;
        }
        if(session('name')) {
            $name = session('name');
            $email = session('email');
        }

        $exams = Exam::where('id', $id)->get();
        $is_quiz = 1;

        $exam_groups = $exams[0]->exam_groups;
        $quizzes = [];
        foreach ($exam_groups as $exam_group) {
            foreach ($exam_group->quizes as $quiz) {
                array_push($quizzes, $quiz);
            }
        }

        return view('preview', ['quizzes' => $quizzes, 'name' => $name, 'email' => $email, 'is_quiz' => $is_quiz]);
    }

    public function exam($name) {
        return view('examRegister', [
            'name' => $name,
        ]);
    }

    public function startExam(Request $request) {
        $input = $request->all();
        $firstName = $input['firstName'];
        $lastName = $input['lastName'];
        $email = $input['email'];
        $name = $input['name'];
        $exam = Exam::where('name', $name)->first();
        $id = $exam->id;

        $userName = $firstName . ' ' . $lastName;
        $rule = [
            'firstName' => 'required|string|max:20|regex:/^[a-zA-Z]+$/',
            'lastName' => 'required|string|max:20|regex:/^[a-zA-Z]+$/',
            'company' => 'required|string|max:20|regex:/^[a-zA-Z]+$/',
        ];

        $messages = [
            'fistName.required' => 'First Name is a required field.',
            'lastName.required' => 'Last Name is a required field.',
            'email.required' => 'Email is a required field.',
            'company.required' => 'Company is a required field.',
            'firstName.regex' => 'First Name can contains only letters',
            'lastName.regex' => 'First Name can contains only letters',
            'company.regex' => 'First Name can contains only letters',
        ];

        $validator = Validator::make($input, $rule, $messages);
        if($validator->fails()) {
            return redirect()->route('exam', ['name' => $name])
                ->withInput($input)
                ->withErrors($validator->errors());
        }

        return redirect()->route('preview_exam', [
            'id' => $id,
        ])->with('name', $userName)->with('email', $email)->with('student', true);
    }
}
