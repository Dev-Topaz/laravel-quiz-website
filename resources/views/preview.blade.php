@extends('layouts.preview')

@section('content')
    @foreach ($quizzes as $quiz)
        <div id="quiz_list_container-{{ $quiz->id }}"
             style="margin:0 auto;width: 656px;height: 500px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}" >
            <div class="quiz_item_container"
                 style="position:relative;padding: 20px;width: 100%;height: 100%;{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';') : '' }}">
                {!! $quiz->question_element !!}
                {!! $quiz->answer_element !!}
                {!! $quiz->media_element !!}
            </div>
        </div>
    @endforeach
    <div style="margin: 20px auto;display: flex;flex-direction: row;align-content: center;justify-content: center;align-items: center;">
        <button style="background-color: green;font-size: 20px;color: white;font-weight: bold;padding: 5px 20px;border-radius: 5px;border: 1px solid darkseagreen;transform: translateX(220px);">Submit</button>
    </div>
@endsection
