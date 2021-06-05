@extends('layouts.preview')

@section('content')
    <div id="question_list_modal">
        <span id="question_list_modal_close">&times;</span>
        <div id="question_list_modal_content">
            <div class="row" id="question_list_header">
                <div class="col-9">Question</div>
                <div class="col-1">Awarded</div>
                <div class="col-1">Points</div>
                <div class="col-1">Result</div>
            </div>
            <div id="question_list_content" style="overflow-y: scroll;height: 440px;">
{{--                <div class="row question_list_body">--}}
{{--                    <div class="col-9 question_content">1. This question type allows students to write in their answer.--}}
{{--                        This type of question has to be manually assessed by a trainer, It is not automatically assessed--}}
{{--                        by the quiz engine.--}}
{{--                    </div>--}}
{{--                    <div class="col-1 question_awarded">-</div>--}}
{{--                    <div class="col-1 question_points">-</div>--}}
{{--                    <div class="col-1 question_result">--}}
{{--                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"--}}
{{--                             x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24"--}}
{{--                             style="enable-background:new 0 0 24 24;" xml:space="preserve"--}}
{{--                             class="quiz-slide-list-status-icon__icon quiz-slide-list-status-icon__icon_answered"><circle--}}
{{--                                fill="#FFFFFF" cx="12" cy="12" r="12"></circle>--}}
{{--                            <path fill="#528BDF"--}}
{{--                                  d="M12,22C6.5,22,2,17.5,2,12S6.5,2,12,2s10,4.5,10,10S17.5,22,12,22z M9,11H7v2h2V11z M13,11h-2v2h2V11z M17,11 	h-2v2h2V11z"></path></svg>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="row question_list_body">--}}
{{--                    <div class="col-9 question_content">2. THIS QUESTION TYPE IS: MULTIPLE CHOICE This question type is--}}
{{--                        auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This--}}
{{--                        will automatically be included in the final results that is emailed to the student. A box holds--}}
{{--                        15 cauliflowers. At the end of the day, the crew had filled 86 boxes. How many cauliflowers is--}}
{{--                        that in total?--}}
{{--                    </div>--}}
{{--                    <div class="col-1 question_awarded">1</div>--}}
{{--                    <div class="col-1 question_points">1</div>--}}
{{--                    <div class="col-1 question_result">--}}
{{--                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"--}}
{{--                             x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24"--}}
{{--                             style="enable-background:new 0 0 24 24;" xml:space="preserve"--}}
{{--                             class="quiz-slide-list-status-icon__icon quiz-slide-list-status-icon__icon_correct"><circle--}}
{{--                                fill="#FFFFFF" cx="12" cy="12" r="12"></circle>--}}
{{--                            <path fill="#7CB911"--}}
{{--                                  d="M12,2C6.5,2,2,6.5,2,12s4.5,10,10,10s10-4.5,10-10S17.5,2,12,2z M17.9,8.9l-7.7,7.7 	c-0.4,0.4-0.9,0.4-1.3,0l-3.2-3.2c-0.4-0.4-0.4-0.9,0-1.3s0.9-0.4,1.3,0l2.5,2.5l7.1-7.1c0.3-0.4,0.9-0.4,1.3,0 	C18.2,7.9,18.2,8.5,17.9,8.9C17.9,8.9,17.9,8.9,17.9,8.9z"></path></svg>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="row question_list_body">--}}
{{--                    <div class="col-9 question_content">3. THIS QUESTION TYPE IS: MULTIPLE CHOICE This question type is--}}
{{--                        auto assessable. If the correct answer is selected the quiz engine will mark it as correct. This--}}
{{--                        will automatically be included in the final results that is emailed to the student. Which sign--}}
{{--                        best describes a risk to electrocution.--}}
{{--                    </div>--}}
{{--                    <div class="col-1 question_awarded">0</div>--}}
{{--                    <div class="col-1 question_points">1</div>--}}
{{--                    <div class="col-1 question_result">--}}
{{--                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"--}}
{{--                             x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24"--}}
{{--                             style="enable-background:new 0 0 24 24;" xml:space="preserve"--}}
{{--                             class="quiz-slide-list-status-icon__icon quiz-slide-list-status-icon__icon_incorrect"><circle--}}
{{--                                fill="#FFFFFF" cx="12" cy="12" r="12"></circle>--}}
{{--                            <path fill="#DB5A4B"--}}
{{--                                  d="M12,2C6.5,2,2,6.5,2,12s4.5,10,10,10s10-4.5,10-10S17.5,2,12,2z M16.4,8.8L13.2,12l2.9,2.9 	c0.3,0.3,0.3,0.9,0,1.2c-0.3,0.3-0.9,0.3-1.2,0l0,0L12,13.2l-3.2,3.2c-0.3,0.3-0.9,0.3-1.2,0s-0.3-0.9,0-1.2l3.2-3.2L7.9,9.1 	c-0.3-0.3-0.3-0.9,0-1.2s0.9-0.3,1.2,0l2.9,2.9l3.2-3.2c0.3-0.3,0.9-0.3,1.2,0C16.7,7.9,16.8,8.4,16.4,8.8 	C16.4,8.8,16.4,8.8,16.4,8.8z"></path></svg>--}}
{{--                    </div>--}}
{{--                </div>--}}
                @foreach($quizzes as $quiz)
                    @if ($quiz->type_id < 14)
                        <div class="row question_list_body" id="question_list-{{ $quiz->id }}">
                            <div class="col-9 question_content">{{ strip_tags($quiz->question_element) }}
                            </div>
                            <div class="col-1 question_awarded">-</div>
                            <div class="col-1 question_points">{{ $quiz->type_id > 11 ? '-' : $quiz->correct_score }}</div>
                            <div class="col-1 question_result">
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>
        </div>
    </div>
    <div id="is_quiz" style="display: none;">{{ $is_quiz }}</div>
    <div id="user_name" style="display: none;">{{ $user->name }}</div>
    <div id="user_email" style="display: none;">{{ $user->email }}</div>
    <div class="question_menu_bar" style="margin: 0 auto;width: 656px;display: flex;justify-content: space-between;">
        <p id="question_list">Question <span id="question_number">1</span></p>
        <div id="question_result" style="display: flex;">
            <p id="question_point">Point Value: <span>10</span> | </p>
            <p>Total Points: <span id="total_point">0</span> out of <span id="passing_score">100</span></p>
        </div>
    </div>
    @php
        $index = 0
    @endphp
    @foreach ($quizzes as $quiz)
        @if ($quiz->type_id < 14)
            <div id="quiz_list_container-{{ $quiz->id }}"
                 class="quiz_list_container {{ $index == 0 ? 'quiz_show' : 'quiz_hide' }}"
                 style="margin:0 auto;width: {{ $quiz->exam_group->exam->screen_width }}px;height: {{ $quiz->exam_group->exam->screen_height }}px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}">
                <div class="quiz_item_container"
                     style="{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';background-size:100% 100%;background-repeat: no-repeat;') : '' }}">
                    {!! $quiz->question_element !!}
                    {!! $quiz->answer_element !!}
                    {!! $quiz->media_element !!}
                    {!! $quiz->video_element !!}
                    {!! $quiz->other_elements !!}
                    <audio controls autoplay id="quiz_list_audio-{{ $quiz->id }}" style="display: none;">
                        <source src="{{ $quiz->audio }}" type="audio/mpeg">
                    </audio>
                </div>
                <div class="quiz_id" style="display: none;">{!! $quiz->id !!}</div>
                <div class="type_id" style="display: none;">{!! $quiz->type_id !!}</div>
                <div class="correct_answer" style="display: none;">{!! $quiz->answer !!}</div>
                <div class="attempts" style="display: none;">{!! $quiz->attempts !!}</div>
                <div class="feedback_correct" style="display: none;">{!! $quiz->feedback_correct !!}</div>
                <div class="feedback_incorrect" style="display: none;">{!! $quiz->feedback_incorrect !!}</div>
                <div class="feedback_try_again" style="display: none;">{!! $quiz->feedback_try_again !!}</div>
                <div class="correct_score" style="display: none;">{!! $quiz->correct_score !!}</div>
                <div class="incorrect_score" style="display: none;">{!! $quiz->incorrect_score !!}</div>
                <div class="try_again_score" style="display: none;">{!! $quiz->try_again_score !!}</div>
                <div class="question_type" style="display: none;">{!! $quiz->question_type !!}</div>
                <div class="feedback_type" style="display: none;">{!! $quiz->feedback_type !!}</div>
                <div class="shuffle_answers" style="display: none;">{!! $quiz->shuffle_answers !!}</div>
                <div class="case_sensitive" style="display: none;">{!! $quiz->case_sensitive !!}</div>
                <div class="partially_correct" style="display: none;">{!! $quiz->partially_correct !!}</div>
                <div class="stuff_emails" style="display: none;">{!! $quiz->exam_group->exam->stuff_emails !!}</div>
                <div class="passing_score" style="display: none;">{!! $quiz->exam_group->exam->passing_score !!}</div>
            </div>
            @php
                $index += 1
            @endphp
        @endif
    @endforeach
    @foreach ($quizzes as $quiz)
        @if ($quiz->type_id > 13)
            <div id="quiz_list_container-{{ $quiz->id }}"
                 class="quiz_list_container {{ $index == 0 ? 'quiz_show' : 'quiz_hide' }}"
                 style="margin:0 auto;width: {{ $quiz->exam_group->exam->screen_width }}px;height: {{ $quiz->exam_group->exam->screen_height }}px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}">
                <div class="quiz_item_container"
                     style="{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';background-size:100% 100%;background-repeat: no-repeat;') : '' }}">
                    {!! $quiz->question_element !!}
                    {!! $quiz->answer_element !!}
                    {!! $quiz->media_element !!}
                    {!! $quiz->video_element !!}
                    {!! $quiz->other_elements !!}
                    <audio controls autoplay id="quiz_list_audio-{{ $quiz->id }}" style="display: none;">
                        <source src="{{ $quiz->audio }}" type="audio/mpeg">
                    </audio>
                </div>
                <div class="quiz_id" style="display: none;">{!! $quiz->id !!}</div>
                <div class="type_id" style="display: none;">{!! $quiz->type_id !!}</div>
                <div class="correct_answer" style="display: none;">{!! $quiz->answer !!}</div>
                <div class="attempts" style="display: none;">{!! $quiz->attempts !!}</div>
                <div class="feedback_correct" style="display: none;">{!! $quiz->feedback_correct !!}</div>
                <div class="feedback_incorrect" style="display: none;">{!! $quiz->feedback_incorrect !!}</div>
                <div class="feedback_try_again" style="display: none;">{!! $quiz->feedback_try_again !!}</div>
                <div class="correct_score" style="display: none;">{!! $quiz->correct_score !!}</div>
                <div class="incorrect_score" style="display: none;">{!! $quiz->incorrect_score !!}</div>
                <div class="try_again_score" style="display: none;">{!! $quiz->try_again_score !!}</div>
                <div class="question_type" style="display: none;">{!! $quiz->question_type !!}</div>
                <div class="feedback_type" style="display: none;">{!! $quiz->feedback_type !!}</div>
                <div class="shuffle_answers" style="display: none;">{!! $quiz->shuffle_answers !!}</div>
                <div class="case_sensitive" style="display: none;">{!! $quiz->case_sensitive !!}</div>
                <div class="stuff_emails" style="display: none;">{!! $quiz->exam_group->exam->stuff_emails !!}</div>
                <div class="passing_score" style="display: none;">{!! $quiz->exam_group->exam->passing_score !!}</div>
            </div>
            @php
                $index += 1
            @endphp
        @endif
    @endforeach
    <div class="preview_btn">
        <a href="javascript:void(0)" id="clear_hotspots" style="visibility: hidden;">Clear</a>
        <button onclick="preview()">Submit</button>
    </div>
@endsection
