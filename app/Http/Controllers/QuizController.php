<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use App\Models\Answer;
use App\Models\MultiChoiceAnswerContent;
use App\Models\MultiResponseAnswerContent;
use App\Models\NumericAnswerContent;
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'answer' => 'required',
        ]);

        $quiz = Quiz::create([
            'exam_id' => $request->exam_id,
            'layout' => 1,
            'type_id' => $request->type_id,
            'question' => $request->question,
            'answer' => $request->answer,
            'feedback_correct' => $request->feedback_correct,
            'feedback_incorrect' => $request->feedback_incorrect,
            'feedback_try_again' => $request->feedback_try_again,
            'is_feedback' => $request->is_feedback == 'feedback_checked' ? true : false,
            'is_draft' => false,
            ]);

        switch ($request->type_id) {
            case "1":

        //        insert at multi_choice_answer_contents table
                $answer_content_array = explode(';', $request->answer_content_array);
                array_pop($answer_content_array);
                $choice_id_array = explode(';', $request->choice_id_array);
                array_pop($choice_id_array);

                foreach($answer_content_array as $key => $value) {
                    MultiChoiceAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'content' => $answer_content_array[$key],
                        'choice_id' => $choice_id_array[$key],
                    ]);
                }
                break;

            case "2":

        //        insert at multi_response_answer_contents table
                $answer_content_array = explode(';', $request->answer_content_array);
                array_pop($answer_content_array);
                $response_id_array = explode(';', $request->response_id_array);
                array_pop($response_id_array);

                foreach($answer_content_array as $key => $value) {
                    MultiResponseAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'content' => $answer_content_array[$key],
                        'response_id' => $response_id_array[$key],
                    ]);
                }
                break;

            case "5":
                $select_answer_array = explode('@', $request->select_answer);
                array_pop($select_answer_array);

                foreach ($select_answer_array as $key=>$value) {
                    $value_array = explode(';', $value);
                    NumericAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'option_value' => $value_array[0],
                        'input_value_1' => $value_array[1],
                        'input_value_2' => $value_array[2],
                    ]);
                }
                break;
            default:
        }


            $redirect_url = '/exams/' . $request->exam_id;

            return redirect($redirect_url)
                ->with('success', 'Quiz created successfully');
        }

        /**
         * Display the specified resource.
         *
         * @param  \App\Models\Quiz  $quiz
         * @return \Illuminate\Http\Response
         */
        public function show(Quiz $quiz)
        {
            if ($quiz->type_id == 6) {
                $sequence_array = explode(';', $quiz->answer);
                array_pop($sequence_array);
                $quiz->sequence_array = $sequence_array;
            }
            return view('quizes.show', ['quiz' => $quiz]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Quiz  $quiz
     * @return \Illuminate\Http\Response
     */
    public function edit(Quiz $quiz)
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

            $quiz->item_array = $item_array;
            $quiz->matching_array = $matching_array;
        }
        return view('quizes.update', ['quiz' => $quiz]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Quiz  $quiz
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Quiz $quiz)
    {

        $quiz->question = $request->question;
        $quiz->answer = $request->answer;
        $quiz->is_feedback = $request->is_feedback ? true : false;
        $quiz->feedback_correct = $request->feedback_correct;
        $quiz->feedback_incorrect = $request->feedback_incorrect;
        $quiz->feedback_try_again = $request->feedback_try_again;

        $quiz->save();

        switch ($request->type_id) {
            case "1":

                MultiChoiceAnswerContent::where('quiz_id', $quiz->id)->delete();
        //        insert at multi_choice_answer_contents table
                $answer_content_array = explode(';', $request->answer_content_array);
                array_pop($answer_content_array);
                $choice_id_array = explode(';', $request->choice_id_array);
                array_pop($choice_id_array);

                foreach($answer_content_array as $key => $value) {
                    MultiChoiceAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'content' => $answer_content_array[$key],
                        'choice_id' => $choice_id_array[$key],
                    ]);
                }
                break;

            case "2":

                MultiResponseAnswerContent::where('quiz_id', $quiz->id)->delete();
        //        insert at multi_choice_answer_contents table
                $answer_content_array = explode(';', $request->answer_content_array);
                array_pop($answer_content_array);
                $response_id_array = explode(';', $request->response_id_array);
                array_pop($response_id_array);

                foreach($answer_content_array as $key => $value) {
                    MultiResponseAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'content' => $answer_content_array[$key],
                        'response_id' => $response_id_array[$key],
                    ]);
                }
                break;

            case "5":
                NumericAnswerContent::where('quiz_id', $quiz->id)->delete();
                $select_answer_array = explode('@', $request->select_answer);
                array_pop($select_answer_array);

                foreach ($select_answer_array as $key=>$value) {
                    $value_array = explode(';', $value);
                    NumericAnswerContent::create([
                        'quiz_id' => $quiz->id,
                        'option_value' => $value_array[0],
                        'input_value_1' => $value_array[1],
                        'input_value_2' => $value_array[2],
                    ]);
                }
                break;

            default:
        }



        $redirect_url = '/exams/' . $request->exam_id;

        return redirect($redirect_url)
            ->with('success', 'Quiz updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Quiz  $quiz
     * @return \Illuminate\Http\Response
     */
    public function destroy(Quiz $quiz)
    {
        switch ($quiz->type_id) {
            case "1":

                MultiChoiceAnswerContent::where('quiz_id', $quiz->id)->delete();
                break;

            case "2":

                MultiResponseAnswerContent::where('quiz_id', $quiz->id)->delete();
                break;

            case "5":
                NumericAnswerContent::where('quiz_id', $quiz->id)->delete();
                break;

            default:
        }

        $quiz->delete();

        $redirect_url = '/exams/' . $quiz->exam_id;

        return redirect($redirect_url)
            ->with('success', 'Quiz deleted successfully');
    }
}
