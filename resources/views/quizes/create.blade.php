@extends('layouts.app')

@section('content')
<div id="main">
    <div id="content" class="full">
        <div class="post manage_forms">
            <div class="content_header">
                <div class="content_header_title">
                    <div style="float: left">
                        <h2>Create a New Quiz
                        </h2>
                        <p>Create a quiz</p>
                    </div>
                    <div style="clear: both; height: 1px"></div>
                </div>
            </div>


            <div class="content_body">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <form method="POST" action="{{ url('/quizes') }}" class="create_form">
                                @csrf
                                <input id="exam_id" type="text"
                                       class="form-control @error('exam_id') is-invalid @enderror" name="exam_id"
                                       value="{{ $exam_id }}" required autocomplete="exam_id" autofocus hidden>
                                <input id="type_id" type="text"
                                       class="form-control @error('type_id') is-invalid @enderror" name="type_id"
                                       value="{{ $quiz_type }}" required autocomplete="type_id" autofocus hidden>
                                <input id="answer_content_array" type="text"
                                       class="form-control @error('answer_content_array') is-invalid @enderror" name="answer_content_array"
                                       value="" autocomplete="answer_content_array" autofocus hidden>
                                <input id="choice_id_array" type="text"
                                       class="form-control @error('choice_id_array') is-invalid @enderror" name="choice_id_array"
                                       value="" autocomplete="choice_id_array" autofocus hidden>
                                <div class="form-group row">
                                    <label for="question" class="col-md-3 col-form-label text-md-right">{{
                                        __('Question') }}</label>
                                    <div class="col-md-7">
                                        <textarea id="question"
                                                  class="form-control @error('question') is-invalid @enderror"
                                                  name="question"
                                                  value="{{ old('question') }}" rows="4" cols="50"
                                                  autocomplete="question" required></textarea>

                                        @error('question')
                                        <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="answer" class="col-md-3 col-form-label text-md-right">{{ __('Answer')
                                        }}</label>
                                    <div class="col-md-7" id="answer_content">
                                        @if($quiz_type == 1)
                                        <a id="add_choice" style="padding: 10px 0;">Type to add a new choice</a>
                                        @else
                                        <input id="answer" type="text"
                                               class="form-control @error('answer') is-invalid @enderror" name="answer"
                                               value="{{ old('answer') }}" required autocomplete="answer" autofocus>
                                        @error('answer')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row" style="align-items: center">
                                    <label for="is_feedback" class="col-md-3 col-form-label text-md-right">{{ __('Feedback')
                                        }}</label>
                                    <div class="col-md-7">
                                        <input id="is_feedback" type="checkbox"
                                               class="@error('is_feedback') is-invalid @enderror" name="is_feedback"
                                               value="feedback_checked" checked autocomplete="is_feedback" autofocus>
                                        @error('is_feedback')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="feedback_correct" class="col-md-3 col-form-label text-md-right">{{ __('Feedback Correct')
                                        }}</label>
                                    <div class="col-md-7">
                                        <input id="feedback_correct" type="text"
                                               class="form-control @error('feedback_correct') is-invalid @enderror" name="feedback_correct"
                                               value="{{ old('feedback_correct') }}" required autocomplete="feedback_correct" autofocus>
                                        @error('feedback_correct')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="feedback_incorrect" class="col-md-3 col-form-label text-md-right">{{ __('Feedback Incorrect')
                                        }}</label>
                                    <div class="col-md-7">
                                        <input id="feedback_incorrect" type="text"
                                               class="form-control @error('feedback_incorrect') is-invalid @enderror" name="feedback_incorrect"
                                               value="{{ old('feedback_incorrect') }}" required autocomplete="feedback_incorrect" autofocus>
                                        @error('feedback_incorrect')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="feedback_try_again" class="col-md-3 col-form-label text-md-right">{{ __('Feedback Try Again')
                                        }}</label>
                                    <div class="col-md-7">
                                        <input id="feedback_try_again" type="text"
                                               class="form-control @error('feedback_try_again') is-invalid @enderror" name="feedback_try_again"
                                               value="{{ old('feedback_try_again') }}" required autocomplete="feedback_try_again" autofocus>
                                        @error('feedback_try_again')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Create a quiz') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
