<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
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
        Quiz::create([
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
            
            return redirect()->route('exams.index')
            ->with('success', 'Quiz created successfully.');
        }
        
        /**
         * Display the specified resource.
         *
         * @param  \App\Models\Quiz  $quiz
         * @return \Illuminate\Http\Response
         */
        public function show(Quiz $quiz)
        {
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Quiz  $quiz
     * @return \Illuminate\Http\Response
     */
    public function destroy(Quiz $quiz)
    {
        //
    }
}
