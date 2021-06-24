<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Exam;
use Validator;
//use App\Http\Resources\Product as ProductResource;

class ExamController extends BaseController
{
    public function get_downloading_quizzes_index() {
        $quizzes = Exam::where('downloaded', 0)->get();

        $quizzes_index = [];
        foreach ($quizzes as $quiz) {
            array_push($quizzes_index, $quiz->id);
        }

        $success['data'] =  $quizzes_index;

        return $this->sendResponse($success, 'success');
    }

    public function get_quiz($id) {
        $quiz = Exam::find($id);

        $success['data'] = $quiz;
        return $this->sendResponse($success, 'success');
    }
}
