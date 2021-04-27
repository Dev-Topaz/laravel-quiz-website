@extends('layouts.app')

@section('content')
<div id="main">

    <div id="content" class="full">
        <div class="post manage_forms">
            <div class="content_header">
                <div class="content_header_title">
                    <div style="float: left">
                        {{ $quiz->question }}
                    </div>
                    <div style="float: right;margin-right: 0px">
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
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        @if($quiz->type_id == 1)
                                        @foreach($quiz->multi_choice_answer_contents as $answer_content)
                                        <div class="choice_item">
                                            <input type="radio" id="{{ $answer_content->choice_id }}" name="answer" value="{{ $answer_content->choice_id }}" style="padding-right: 10px;">
                                            <label data-editable for="{{ $answer_content->choice_id }}">{{ $answer_content->content }}</label>
                                        </div>
                                        @endforeach
                                        @else
                                        <input id="answer" type="text"
                                               class="form-control @error('answer') is-invalid @enderror"
                                               name="answer"
                                               value="{{ old('answer') }}"
                                               autocomplete="answer">

                                        @error('answer')
                                        <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                        @enderror
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Next Quiz') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div><!-- /.post -->
    </div><!-- /#content -->


    <div class="clear"></div>

</div>
@endsection
