@extends('layouts.app')

@section('content')
<div id="main">

    <div id="ex1" class="modal container">
        <h3>Select Quiz Type</h3>
        <div class="row">
            <div class="col-3"><a href="#"><div class="quiz_type multi_choice"></div>Multiple Choice</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type multi_response"></div>Multiple Response</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type true_false"></div>True/False</a></div>
            <div class="col-3"><a href="{{ url('/quizes/4') }}/exam/{{ $exam->id }}"><div class="quiz_type short_answer"></div>Short Answer</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type numeric"></div>Numeric</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type sequence"></div>Sequence</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type matching"></div>Matching</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type fill_blank"></div>Fill in the Blanks</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type select_lists"></div>Select from Lists</a></div>
            <div class="col-3"><a href="#"><div class="quiz_type hotspot"></div>Hotspot</a></div>
        </div>
    </div>

    <div id="content" class="full">
        <div class="post manage_forms">
            <div class="content_header">
                <div class="content_header_title">
                    <div style="float: left">
                        <h2>{{ $exam->name }}</h2>
                        <p>{{ $exam->description }}</p>
                        <p>Attempt Number: {{ $exam->attempt_number }}, Passing Score: {{ $exam->passing_score }}</p>
                    </div>
                    <div style="float: right;margin-right: 0px">
                        <a href="#ex1" title="Create New quiz" id="button_create_quiz" class="button_primary" rel="modal:open">
                            <i class="fas fa-plus"></i>Create New Quiz
                        </a>
                    </div>
                    <div style="clear: both; height: 1px"></div>
                </div>
            </div>


            <div class="content_body">
                <div class="content_body_main ">
                    <ul id="mf_form_list" style="text-align: center;">
                        @if (count($exam->quizes))
                            @foreach($exam->quizes as $quiz)
                                <li data-theme_id="{{ $quiz->id }}" id="liform_{{ $quiz->id }}" class="form_visible">

                                <div class="middle_form_bar">
                                    <h3>{{ $quiz->question }}</h3>
                                    <div class="form_meta">


                                        <div class="form_actions">
                                            <a class="form_actions_toggle" data-formid="{{ $quiz->id }}" id="form_action_{{ $quiz->id }}"
                                               href="javascript:;"><span class="icon-cog"></span></a>
                                        </div>
                                        <div id="action_toggle_content_{{ $quiz->id }}" style="display: none">
                                            <div class="form_action_item mf_link_delete"><a href="#"><span
                                                        class="icon-trash2"></span> Delete</a></div>

                                            <div class="form_action_item mf_link_duplicate"><a href="#"><span
                                                        class="icon-copy1"></span> Duplicate</a></div>

                                            <div class="form_action_item mf_link_disable">
                                                <a href="#"><span class="icon-pause-circle"></span> Disable</a></div>

                                            <div class="form_action_item"><a title="View Form Info"
                                                                             href="form_info.php?id={{ $quiz->id }}"><span
                                                        class="icon-file-charts"></span> Info</a></div>

                                            <div class="form_action_item mf_link_export"><a title="Export Form Template"
                                                                                            class="exportform"
                                                                                            id="exportform_42152"
                                                                                            href="#"><span
                                                        class="icon-exit-up"></span> Export</a></div>
                                        </div>

                                        <div class="form_tag">
                                            <ul class="form_tag_list">

                                                <li class="form_tag_list_icon">
                                                    <a title="Add a Tag Name" class="addtag" id="addtag_42152"
                                                       href="#"><span class="icon-tag"></span></a>
                                                </li>


                                            </ul>
                                        </div>
                                    </div>
                                    <div style="height: 0px; clear: both;"></div>
                                </div>
                                <div class="bottom_form_bar" style="display: none;">
                                    <div class="form_option">
                                        <a href="manage_entries.php?id=42152"><i class="fas fa-edit"></i>Edit Quiz</a>
                                    </div>
                                    <div class="form_option_separator"></div>
                                    <div class="form_option">
                                        <a href="{{ url('/quizes') }}/{{$quiz->id}}"><i class="far fa-eye"></i>Preview</a>
                                    </div>
                                </div>

                                <div style="height: 0px; clear: both;"></div>
                            </li>
                            @endforeach
                        @else
                            <span>No quiz</span>
                        @endif
                    </ul>

                </div>
            </div>

        </div><!-- /.post -->
    </div><!-- /#content -->


    <div class="clear"></div>

</div>
@endsection
