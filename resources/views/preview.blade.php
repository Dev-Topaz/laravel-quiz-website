@extends('layouts.preview')

@section('content')
        <div class="question_menu_bar" style="margin: 0 auto;width: 656px;">
            <p id="question_list">Question List</p>
            <div id="question_result">
                <p id="correct_question_counts"></p>
                <p id="total_score"></p>
            </div>
        </div>
    @foreach ($quizzes as $key => $quiz)
        <div id="quiz_list_container-{{ $quiz->id }}" class="quiz_list_container {{ $key == 0 ? 'quiz_show' : 'quiz_hide' }}"
             style="margin:0 auto;width: {{ $quiz->exam_group->exam->screen_width }}px;height: {{ $quiz->exam_group->exam->screen_height }}px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}" >
            <div class="quiz_item_container"
                 style="{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';background-size:100% 100%;background-repeat: no-repeat;') : '' }}">
                {!! $quiz->question_element !!}
                {!! $quiz->answer_element !!}
                {!! $quiz->media_element !!}
                {!! $quiz->video_element !!}
                <audio controls autoplay id="quiz_list_audio-{{ $quiz->id }}" style="display: none;">
                    <source src="{{ $quiz->audio }}" type="audio/mpeg">
                </audio>
            </div>
            <div class="type_id" style="display: none;">{!! $quiz->type_id !!}</div>
            <div class="correct_answer" style="display: none;">{!! $quiz->answer !!}</div>
            <div class="attempts" style="display: none;">{!! $quiz->attempts !!}</div>
            <div class="feedback_correct" style="display: none;">{!! $quiz->feedback_correct !!}</div>
            <div class="feedback_incorrect" style="display: none;">{!! $quiz->feedback_incorrect !!}</div>
            <div class="feedback_try_again" style="display: none;">{!! $quiz->feedback_try_again !!}</div>
            <div class="correct_score" style="display: none;">{!! $quiz->correct_score !!}</div>
            <div class="incorrect_score" style="display: none;">{!! $quiz->incorrect_score !!}</div>
            <div class="try_again_score" style="display: none;">{!! $quiz->try_again_score !!}</div>
        </div>
    @endforeach
    <div class="preview_btn">
        <button style="transform: translateX(220px);" onclick="preview()">Submit</button>
    </div>
@endsection
