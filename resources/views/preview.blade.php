@extends('layouts.preview')

@section('content')
    @foreach ($quizzes as $quiz)
        <div class="question_menu_bar" style="margin: 0 auto;width: 656px;">
            <p id="question_list">Question List</p>
            <div id="question_result">
                <p id="correct_question_counts"></p>
                <p id="total_score"></p>
            </div>
        </div>
        <div id="quiz_list_container-{{ $quiz->id }}" class="quiz_list_container"
             style="margin:0 auto;width: 656px;height: 500px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}" >
            <div class="quiz_item_container"
                 style="{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';') : '' }}">
                {!! $quiz->question_element !!}
                {!! $quiz->answer_element !!}
                {!! $quiz->media_element !!}
            </div>
            <div id="type_id" style="display: none;">{!! $quiz->type_id !!}</div>
            <div id="answer" style="display: none;">{!! $quiz->answer !!}</div>
            <div id="attempts" style="display: none;">{!! $quiz->attempts !!}</div>
            <div id="feedback_correct" style="display: none;">{!! $quiz->feedback_correct !!}</div>
            <div id="feedback_incorrect" style="display: none;">{!! $quiz->feedback_incorrect !!}</div>
            <div id="feedback_try_again" style="display: none;">{!! $quiz->feedback_try_again !!}</div>
            <div id="correct_score" style="display: none;">{!! $quiz->correct_score !!}</div>
            <div id="incorrect_score" style="display: none;">{!! $quiz->incorrect_score !!}</div>
            <div id="try_again_score" style="display: none;">{!! $quiz->try_again_score !!}</div>
        </div>
    @endforeach
    <div class="preview_btn">
        <button style="transform: translateX(220px);" onclick="preview()">Submit</button>
    </div>
@endsection
