<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Models\ExamGroup;
use App\Models\Quiz;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ExamController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $exams = Exam::latest()->paginate(25);

        return view('exams.index', compact('exams'))
            ->with('i', (request()->input('page', 1) - 1) * 25);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('exams.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'attempt_number' => 'required',
            'passing_score' => 'required',
            'screen_height' => 'required',
            'screen_width' => 'required',
        ]);

        $exam = Exam::create([
            'name' => $request->name,
            'description' => $request->description,
            'author_id' => Auth::user()->id,
            'status' => true,
            'attempt_number' => $request->attempt_number,
            'stuff_emails' => $request->stuff_emails,
            'passing_score' => $request->passing_score,
            'screen_height' => $request->screen_height,
            'screen_width' => $request->screen_width,
        ]);

        ExamGroup::create([
            'group_name' => 'Question Group 1',
            'exam_id' => $exam->id,
        ]);

        //create results group
        $results = ExamGroup::create([
            'group_name' => 'Results',
            'exam_id' => $exam->id,
        ]);

        //create passed page
        Quiz::create([
            'exam_group_id' => $results->id,
            'type_id' => 14,
            'question_element' => '<div class="slide_view_question_element slide_view_group" style="height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;"><div contenteditable="true" class="cancel_drag">Congratulations, you passed!</div></div>',
            'answer' => '',
            'feedback_correct' => 'That\'s right! You chose the correct response.',
            'feedback_incorrect' => 'You did not choose the correct response.',
            'feedback_try_again' => 'You did not choose the correct response. Try again.',
            'media' => null,
            'order' => 0,
            'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;overflow: hidden;"><div class="col-md-12"><div contenteditable="true"><div class="cancel_drag">Your Score: %%</div><div class="cancel_drag">Passing Score: ##</div></div></div></div>',
            'question_type' => 'graded',
            'feedback_type' => 'by_result',
            'branching' => null,
            'score' => null,
            'attempts' => '1',
            'is_limit_time' => false,
            'limit_time' => null,
            'shuffle_answers' => null,
            'partially_correct' => false,
            'limit_number_response' => null,
            'case_sensitive' => null,
            'correct_score' => 0,
            'incorrect_score' => 0,
            'try_again_score' => 0,
        ]);

        //create failed page
        Quiz::create([
            'exam_group_id' => $results->id,
            'type_id' => 15,
            'question_element' => '<div class="slide_view_question_element slide_view_group" style="height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;"><div contenteditable="true" class="cancel_drag">You did not pass.</div></div>',
            'answer' => '',
            'feedback_correct' => 'That\'s right! You chose the correct response.',
            'feedback_incorrect' => 'You did not choose the correct response.',
            'feedback_try_again' => 'You did not choose the correct response. Try again.',
            'media' => null,
            'order' => 0,
            'answer_element' => '<div class="slide_view_answer_element slide_view_group" style="width: 80%;top: 100px;left: 10%;z-index: 2;padding: 10px;position:absolute;overflow: hidden;"><div class="col-md-12"><div contenteditable="true"><div class="cancel_drag">Your Score: %%</div><div class="cancel_drag">Passing Score: ##</div></div></div></div>',
            'question_type' => 'graded',
            'feedback_type' => 'by_result',
            'branching' => null,
            'score' => null,
            'attempts' => '1',
            'is_limit_time' => false,
            'limit_time' => null,
            'shuffle_answers' => null,
            'partially_correct' => false,
            'limit_number_response' => null,
            'case_sensitive' => null,
            'correct_score' => 0,
            'incorrect_score' => 0,
            'try_again_score' => 0,
        ]);

        return redirect()->route('exams.index')
            ->with('success', 'Exam created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Exam $exam
     * @return \Illuminate\Http\Response
     */
    public function show(Exam $exam)
    {
        $exam['quizes'] = $exam->quizes;
        // foreach($exam->quizes as $quiz) {
        //     var_dump($quiz->Quiz_type->name);die;
        // }
        return view('exams.show', compact('exam'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Exam $exam
     * @return \Illuminate\Http\Response
     */
    public function edit(Exam $exam)
    {
        return view('exams.update', ['exam' => $exam]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Exam $exam
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Exam $exam)
    {
        $exam->update($request->all());

        return redirect()->route('exams.index')
            ->with('success', 'Exam updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Exam $exam
     * @return \Illuminate\Http\Response
     */
    public function destroy(Exam $exam)
    {
        $exam->delete();

        return redirect()->route('exams.index')
            ->with('success', 'Exam deleted successfully');
    }
}
