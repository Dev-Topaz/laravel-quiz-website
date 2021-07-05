<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Exam;
use Validator;

//use App\Http\Resources\Product as ProductResource;

class ExamController extends BaseController
{
    public function get_all_index()
    {
        $quizzes = Exam::all();

        $quizzes_index = [];
        foreach ($quizzes as $quiz) {
            array_push($quizzes_index, $quiz->id);
        }

        $success['data'] = $quizzes_index;

        return $this->sendResponse($success, 'success');
    }

    public function get_downloading_quizzes_index()
    {
        $quizzes = Exam::where('downloaded', 0)->get();

        $quizzes_index = [];
        foreach ($quizzes as $quiz) {
            array_push($quizzes_index, $quiz->id);
        }

        $success['data'] = $quizzes_index;

        return $this->sendResponse($success, 'success');
    }

    public function get_quiz($id)
    {
        $quiz = Exam::find($id);

        $success['data'] = $quiz;
        return $this->sendResponse($success, 'success');
    }

    public function get_quiz_assets_url($id)
    {
        $url_list = [];

        $quiz = Exam::find($id);

        if (isset($quiz->theme_style)) array_push($url_list, explode('"); background-size:', explode('background-image:url("', $quiz->theme_style)[1])[0]);

        $questions = $quiz->get_all_questions();

        foreach ($questions as $question) {
            if (isset($question[0]->media)) array_push($url_list, $question[0]->media);
            if (isset($question[0]->video)) array_push($url_list, $question[0]->video);
            if (isset($question[0]->audio)) array_push($url_list, $question[0]->audio);
            if (isset($question[0]->background_img)) array_push($url_list, explode('")', explode('url("', $question[0]->background_img)[1])[0]);

            if (isset($question[0]->other_elements)) {
                $tmp_array = explode('src="', $question[0]->other_elements);
                array_shift($tmp_array);

                foreach ($tmp_array as $tmp) {
                    array_push($url_list, explode('"', $tmp)[0]);
                }
            }
        }

        $success['data'] = $url_list;
        return $this->sendResponse($success, 'success');
    }

    public function get_quiz_html(string $id)
    {
//        if (isset(Auth::user()->id)) {
//            $user = Auth::user();
//            $name = $user->name;
//            $email = $user->email;
//        }
//        if (session('name')) {
//            $name = session('name');
//            $email = session('email');
//        }

        $exams = Exam::where('id', $id)->get();
        $title = $exams[0]->name;
        $is_quiz = 1;

        $exam_groups = $exams[0]->exam_groups;
        $quizzes = [];
        foreach ($exam_groups as $exam_group) {
            foreach ($exam_group->quizes as $quiz) {
                array_push($quizzes, $quiz);
            }
        }

        $html = view('preview', ['quizzes' => $quizzes, 'title' => $title, 'is_quiz' => $is_quiz]);
        $body = explode('</body>', explode('<body>', $html)[1])[0];
        $preview_container = '<div id="preview_container">' . explode('<script', explode('<div id="preview_container">', $html)[1])[0];

        $success['data'] = $preview_container;
        return $this->sendResponse($success, 'success');
    }
}
