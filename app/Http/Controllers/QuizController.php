<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use App\Models\Exam;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\Types\Integer;

class QuizController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(string $quiz_type, string $exam_id)
    {
        return view('quizes.create', ['exam_id' => $exam_id, 'quiz_type' => $quiz_type]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        switch ($request->type_id) {
            case "1":
                $quiz = Quiz::create([
                    'exam_group_id' => $request->exam_group_id,
                    'type_id' => $request->type_id,
                    'question_element' => '<div contenteditable="true" class="slide_view_question_element slide_view_group" style="border: 1px solid black;height: 70px;width: 80%;left: 10%">Select the correct answer option:</div>',
                    'answer' => '1',
                    'feedback_correct' => 'That\'s right! You chose the correct response.',
                    'feedback_incorrect' => 'You did not choose the correct response.',
                    'feedback_try_again' => null,
                    'media' => null,
                    'order' => null,
                    'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%"><div class="col-md-12"><div class="choice_item"><input type="radio" id="1" name="answer" value="1" style="padding-right: 10px;"><label for="1">Option 1</label></div><div class="choice_item"><input type="radio" id="2" name="answer" value="2" style="padding-right: 10px;"><label for="2">Option 2</label></div><div class="choice_item"><input type="radio" id="3" name="answer" value="3" style="padding-right: 10px;"><label for="3">Option 3</label></div></div></div>',
                    'question_type' => 'graded',
                    'feedback_type' => 'by_result',
                    'branching' => 'by_result',
                    'score' => 'by_result',
                    'attempts' => '1',
                    'is_limit_time' => false,
                    'limit_time' => null,
                    'shuffle_answers' => true,
                    'partially_correct' => null,
                    'limit_number_response' => null,
                    'case_sensitive' => null,
                    'correct_score' => 10,
                    'incorrect_score' => 0,
                    'try_again_score' => null,
                ]);

                break;

            case "2":
                $quiz = Quiz::create([
                    'exam_group_id' => $request->exam_group_id,
                    'type_id' => $request->type_id,
                    'question_element' => '<div contenteditable="true" class="slide_view_question_element slide_view_group" style="border: 1px solid black;height: 70px;width: 80%;left: 10%">Select one or more correct answers:</div>',
                    'answer' => '1;',
                    'feedback_correct' => 'That\'s right! You chose the correct response.',
                    'feedback_incorrect' => 'You did not choose the correct response.',
                    'feedback_try_again' => null,
                    'media' => null,
                    'order' => null,
                    'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%"><div class="col-md-12"><div class="response_item"><input type="checkbox" id="1" name="answer" value="1" style="padding-right: 10px;"><label for="1">Option 1</label></div><div class="response_item"><input type="checkbox" id="2" name="answer" value="2" style="padding-right: 10px;"><label for="2">Option 2</label></div><div class="response_item"><input type="checkbox" id="3" name="answer" value="3" style="padding-right: 10px;"><label for="3">Option 3</label></div></div></div>',
                    'question_type' => 'graded',
                    'feedback_type' => 'by_result',
                    'branching' => null,
                    'score' => 'by_result',
                    'attempts' => '1',
                    'is_limit_time' => false,
                    'limit_time' => null,
                    'shuffle_answers' => true,
                    'partially_correct' => false,
                    'limit_number_response' => false,
                    'case_sensitive' => null,
                    'correct_score' => 10,
                    'incorrect_score' => 0,
                    'try_again_score' => null,
                ]);

                break;

            case "3":
                $quiz = Quiz::create([
                    'exam_group_id' => $request->exam_group_id,
                    'type_id' => $request->type_id,
                    'question_element' => '<div contenteditable="true" class="slide_view_question_element slide_view_group" style="border: 1px solid black;height: 70px;width: 80%;left: 10%">Choose whether the statement is true or false:</div>',
                    'answer' => '1',
                    'feedback_correct' => 'That\'s right! You chose the correct response.',
                    'feedback_incorrect' => 'You did not choose the correct response.',
                    'feedback_try_again' => null,
                    'media' => null,
                    'order' => null,
                    'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%"><div class="col-md-12"><div class="choice_item"><input type="radio" id="true" name="answer" value="1" style="padding-right: 10px;"><label for="true">True</label></div><div class="choice_item"><input type="radio" id="false" name="answer" value="0" style="padding-right: 10px;"><label for="0">False</label></div></div></div>',
                    'question_type' => 'graded',
                    'feedback_type' => 'by_result',
                    'branching' => null,
                    'score' => null,
                    'attempts' => '1',
                    'is_limit_time' => false,
                    'limit_time' => null,
                    'shuffle_answers' => null,
                    'partially_correct' => null,
                    'limit_number_response' => null,
                    'case_sensitive' => null,
                    'correct_score' => 10,
                    'incorrect_score' => 0,
                    'try_again_score' => null,
                ]);

                break;

            case "4":
                $quiz = Quiz::create([
                    'exam_group_id' => $request->exam_group_id,
                    'type_id' => $request->type_id,
                    'question_element' => '<div contenteditable="true" class="slide_view_question_element slide_view_group" style="border: 1px solid black;height: 70px;width: 80%;left: 10%">Type your response:</div>',
                    'answer' => 'Correct Answer 1',
                    'feedback_correct' => 'That\'s right! You chose the correct response.',
                    'feedback_incorrect' => 'You did not choose the correct response.',
                    'feedback_try_again' => null,
                    'media' => null,
                    'order' => null,
                    'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%"><div class="col-md-12"><input id="answer" type="text" class="form-control" name="answer" autocomplete="answer"></div></div>',
                    'question_type' => 'graded',
                    'feedback_type' => 'by_result',
                    'branching' => null,
                    'score' => null,
                    'attempts' => '1',
                    'is_limit_time' => false,
                    'limit_time' => null,
                    'shuffle_answers' => null,
                    'partially_correct' => null,
                    'limit_number_response' => null,
                    'case_sensitive' => false,
                    'correct_score' => 10,
                    'incorrect_score' => 0,
                    'try_again_score' => null,
                ]);

                break;

            case "5":
                $quiz = Quiz::create([
                    'exam_group_id' => $request->exam_group_id,
                    'type_id' => $request->type_id,
                    'question_element' => '<div contenteditable="true" class="slide_view_question_element slide_view_group" style="border: 1px solid black;height: 70px;width: 80%;left: 10%">Type your response:</div>',
                    'answer' => '=;0;@',
                    'feedback_correct' => 'That\'s right! You chose the correct response.',
                    'feedback_incorrect' => 'You did not choose the correct response.',
                    'feedback_try_again' => null,
                    'media' => null,
                    'order' => null,
                    'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%"><div class="col-md-12"><input id="answer" type="number" class="form-control" name="answer" autocomplete="answer"></div></div>',
                    'question_type' => 'graded',
                    'feedback_type' => 'by_result',
                    'branching' => null,
                    'score' => null,
                    'attempts' => '1',
                    'is_limit_time' => false,
                    'limit_time' => null,
                    'shuffle_answers' => null,
                    'partially_correct' => null,
                    'limit_number_response' => null,
                    'case_sensitive' => null,
                    'correct_score' => 10,
                    'incorrect_score' => 0,
                    'try_again_score' => null,
                ]);

                break;

            default:
        }


        return $quiz->id;

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function show(Quiz $quiz)
    {
        if ($quiz->type_id == 6) {
            $sequence_array = explode(';', $quiz->answer);
            array_pop($sequence_array);
            $quiz->sequence_array = $sequence_array;
        }
        if ($quiz->type_id == 7) {
            $matching = explode('@', $quiz->answer);
            array_pop($matching);

            $matching_array = [];
            $item_array = [];

            foreach ($matching as $item) {
                array_push($item_array, explode(';', $item)[0]);
                array_push($matching_array, explode(';', $item)[1]);
            }

            shuffle($matching_array);

            $quiz->item_array = $item_array;
            $quiz->matching_array = $matching_array;
        }
        return view('quizes.show', ['quiz' => $quiz]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function edit(Quiz $quiz)
    {
//        if ($quiz->type_id == 6) {
//            $sequence_array = explode(';', $quiz->answer);
//            array_pop($sequence_array);
//            $quiz->sequence_array = $sequence_array;
//        }
//        if ($quiz->type_id == 7) {
//            $matching = explode('@', $quiz->answer);
//            array_pop($matching);
//
//            $matching_array = [];
//            $item_array = [];
//
//            foreach ($matching as $item) {
//                array_push($item_array, explode(';', $item)[0]);
//                array_push($matching_array, explode(';', $item)[1]);
//            }
//
//            $quiz->item_array = $item_array;
//            $quiz->matching_array = $matching_array;
//        }
        return view('quizes.update', ['quiz' => $quiz]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Quiz $quiz)
    {
        $quiz->question_element = $request->question_element;
        $quiz->answer = $request->answer;
        $quiz->feedback_correct = $request->feedback_correct;
        $quiz->feedback_incorrect = $request->feedback_incorrect;
        $quiz->feedback_try_again = $request->feedback_try_again;
        $quiz->media = $request->media;
        $quiz->order = $request->order;
        $quiz->answer_element = $request->answer_element;
        $quiz->question_type = $request->question_type;
        $quiz->feedback_type = $request->feedback_type;
        $quiz->branching = $request->branching;
        $quiz->score = $request->score;
        $quiz->attempts = $request->attempts;
        $quiz->is_limit_time = $request->is_limit_time;
        $quiz->limit_time = $request->limit_time;
        $quiz->shuffle_answers = $request->shuffle_answers;
        $quiz->partially_correct = $request->partially_correct;
        $quiz->limit_number_response = $request->limit_number_response;
        $quiz->case_sensitive = $request->case_sensitive;
        $quiz->correct_score = $request->correct_score;
        $quiz->incorrect_score = $request->incorrect_score;
        $quiz->try_again_score = $request->try_again_score;

        $quiz->save();

        return $quiz->id;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function destroy(Quiz $quiz)
    {

        $quiz->delete();

        return true;
    }

    public function update_theme_style(Request $request)
    {

        $exam = Exam::where('id', $request->exam_id)
            ->update(['theme_style' => $request->style]);

        return true;
    }
}
