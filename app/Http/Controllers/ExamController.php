<?php

namespace App\Http\Controllers;

use App\Models\Exam;
use App\Models\ExamGroup;
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
     * @param  \Illuminate\Http\Request  $request
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
            'passing_score' => $request->passing_score,
            'screen_height' => $request->screen_height,
            'screen_width' => $request->screen_width,
        ]);

        ExamGroup::create([
            'group_name' => 'Question Group 1',
            'exam_id' => $exam->id,
        ]);

        ExamGroup::create([
            'group_name' => 'Results',
            'exam_id' => $exam->id,
        ]);

        return redirect()->route('exams.index')
            ->with('success', 'Exam created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Exam  $exam
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
     * @param  \App\Models\Exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function edit(Exam $exam)
    {
        return view('exams.update', ['exam' => $exam]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Exam  $exam
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
     * @param  \App\Models\Exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function destroy(Exam $exam)
    {
        $exam->delete();

        return redirect()->route('exams.index')
            ->with('success', 'Exam deleted successfully');
    }
}
