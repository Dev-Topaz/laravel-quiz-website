@extends('layouts.quiz')

@section('content')
    <div id="main" class="quiz">
        <h2>{{ $exam->name }}</h2>

        <nav data-role="ribbonmenu">
            <ul class="tabs-holder">
                <li><a href="#section-home">Home</a></li>
                <li><a href="#section-help">Help</a></li>
            </ul>

            <div class="content-holder">
                <div class="section" id="section-home">
                    <div class="group">
                        <div>
                            <button class="ribbon-button dropdown-toggle">
                                <span class="icon">
                                    <img src="{{ url('images/add_question.png') }}">
                                </span>
                                <span class="caption">Question</span>
                            </button>
                            <div class="container ribbon-dropdown" data-role="dropdown" data-duration="100"
                                 style="width: 500px;">
                                <h3>Questions</h3>
                                <div class="row">
                                    <div class="col-3">
                                        <a href="javascript:void(0)" onclick="create_quiz(1, {{$exam->id}})">
                                            <div class="quiz_type multi_choice"><img
                                                    src="{{asset('images/multi_choice.png')}}"
                                                    alt="Multiple Choice"></div>
                                            Multiple Choice
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="javascript:void(0)" onclick="create_quiz(2, {{ $exam->id }})">
                                            <div class="quiz_type multi_response"><img
                                                    src="{{asset('images/multi_response.png')}}"
                                                    alt="Multiple Response"></div>
                                            Multiple Response
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/3') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type true_false"><img
                                                    src="{{asset('images/true_false.png')}}" alt="True/False"></div>
                                            True/False
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/4') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type short_answer"><img
                                                    src="{{asset('images/short_answer.png')}}" alt="Short Answer">
                                            </div>
                                            Short Answer
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/5') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type numeric"><img
                                                    src="{{asset('images/numeric.png')}}" alt="Numeric"></div>
                                            Numeric
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/6') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type sequence"><img
                                                    src="{{asset('images/sequence.png')}}" alt="Sequence"></div>
                                            Sequence
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/7') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type matching"><img
                                                    src="{{asset('images/matching.png')}}" alt="Matching"></div>
                                            Matching
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/8') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type fill_blank"><img
                                                    src="{{asset('images/fill_blank.png')}}"
                                                    alt="Fill in the Blank"></div>
                                            Fill in the Blanks
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/9') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type select_lists"><img
                                                    src="{{asset('images/select_lists.png')}}"
                                                    alt="Select from lists"></div>
                                            Select from Lists
                                        </a>
                                    </div>
                                    <div class="col-3">
                                        <a href="{{ url('/quizes/10') }}/exam/{{ $exam->id }}">
                                            <div class="quiz_type hotspot"><img
                                                    src="{{asset('images/hotspot.png')}}" alt="Hotspot"></div>
                                            Hotspot
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex;flex-direction: column;">
                            <button class="ribbon-icon-button">
                                <span class="icon">
                                    <img src="#">
                                </span>
                                <span class="caption">Intro Slide</span>
                            </button>
                            <button class="ribbon-icon-button">
                                <span class="icon">
                                    <img src="#">
                                </span>
                                <span class="caption">Question Group</span>
                            </button>
                            <button class="ribbon-icon-button">
                                <span class="icon">
                                    <img src="#">
                                </span>
                                <span class="caption">Introduction</span>
                            </button>
                        </div>

                        <span class="title">Insert</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Slide</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Clipboard</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Text</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Insert</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Quiz</span>
                    </div>

                    <div class="group">
                        <button class="ribbon-button">
                        <span class="icon">
                            <img src="#">
                        </span>
                            <span class="caption">Share</span>
                        </button>

                        <span class="title">Publish</span>
                    </div>
                </div>
                <div class="section" id="section-help">
                    <p class="p-4">Section Help</p>
                </div>
            </div>
        </nav>

        <div id="content" class="full">
            <div class="post manage_forms">
                <div class="content_header">
                    <div class="content_header_title">
                        <div style="float: left">
                            <p>{{ $exam->description }}</p>
                            <p>Attempt Number: {{ $exam->attempt_number }}, Passing
                                Score: {{ $exam->passing_score }}</p>
                        </div>
                        <div style="clear: both; height: 1px"></div>
                    </div>
                </div>

                <div class="content_body">
                    <div class="row">
                        <div class="cell-3">
                            <div class="content_body_main " style="overflow-y: scroll;height: 650px;">
                                <ul data-role="listview" data-view="content" id="quiz_list"
                                    data-on-node-click="onNodeClick">
                                    <li data-caption="Question Group">
                                        <ul>
                                            @foreach($exam->quizes as $quiz)
                                                <li id="{{ $quiz->id }}"
                                                    data-caption="{{ substr(strip_tags($quiz->question), 0,  29) }}{{ strlen(strip_tags($quiz->question)) < 30 ? '' : '...' }}"
                                                    data-content="<i>{{ $quiz->Quiz_type->name }}</i>"></li>
                                            @endforeach
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="cell-9" id="quiz_form" style="padding: 0;">
                        </div>
                    </div>
                </div>

            </div><!-- /.post -->
        </div><!-- /#content -->
    </div>
    <script>
        function onNodeClick(node) {
            const quizId = node.attr('id');
            $.get("{{ url('/quizes') }}/" + quizId + "/edit", function (data, status) {
                $('#quiz_form').html(data);
            });
        }

        function create_quiz(quiz_type, exam_id) {
            console.log(quiz_type, exam_id);

            let quizId;
            const lv = Metro.getPlugin('#quiz_list', 'listview');
            const node = $('#quiz_list ul li:last-child');

            switch (quiz_type) {
                case(1):
                    lv.insertAfter(node, {
                        caption: 'Select the correct answer option:',
                        content: '<i>Multiple Choice<i>'
                    });
                    $('#quiz_list').find('.current').removeClass('current current-select');
                    node.next().addClass('current current-select');
                    node.next().attr('id', quizId);

                    $.post("{{ url('/quizes') }}", {
                            '_token': "{{ csrf_token() }}",
                            'type_id': quiz_type,
                            'exam_id': exam_id,
                            'question': 'Select the correct answer option:',
                            'answer': '1',
                            'feedback_correct': 'That\'s right! You answered correctly.',
                            'feedback_incorrect': 'You did not choose the correct response.',
                            'feedback_try_again': 'Try again.',
                            'is_feedback': true,
                            'answer_content_array': 'Option 1;Option 2;Option 3;',
                            'choice_id_array': '1;2;3;'
                        },
                        function (data, status) {
                            quizId = data;
                            node.next().attr('id', quizId);
                        }).catch((XHttpResponse) => {
                        console.log(XHttpResponse);
                    });
                    break;

                case(2):
                    lv.insertAfter(node, {
                        caption: 'Select the correct answer option:',
                        content: '<i>Multiple Choice<i>'
                    });
                    $('#quiz_list').find('.current').removeClass('current current-select');
                    node.next().addClass('current current-select');
                    node.next().attr('id', quizId);

                    $.post("{{ url('/quizes') }}", {
                            '_token': "{{ csrf_token() }}",
                            'type_id': quiz_type,
                            'exam_id': exam_id,
                            'question': 'Select one or more correct answers:',
                            'answer': '1',
                            'feedback_correct': 'That\'s right! You answered correctly.',
                            'feedback_incorrect': 'You did not choose the correct response.',
                            'feedback_try_again': 'Try again.',
                            'is_feedback': true,
                            'answer_content_array': 'Option 1;Option 2;Option 3;',
                            'response_id_array': '1;2;3;'
                        },
                        function (data, status) {
                            quizId = data;
                            node.next().attr('id', quizId);
                        }).catch((XHttpResponse) => {
                        console.log(XHttpResponse);
                    });
                    break;

                default:
            }

            $.get("{{ url('/quizes') }}/" + quiz_type + "/exam/" + exam_id, function (data, status) {
                $('#quiz_form').html(data);
            });

        }

    </script>
@endsection
