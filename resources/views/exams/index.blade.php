@extends('layouts.app')

@section('content')
    <div id="quiz_delete_confirm_dialog" class="quiz_dialog">
        <input id="quiz_delete_dialog_id" type="text" hidden>
        <div id="quiz_delete_dialog_content" class="quiz_dialog_content">Are you sure you want to delete?</div>
        <div id="quiz_delete_dialog_btn" class="quiz_dialog_btn">
            <button id="quiz_delete_yes" class="button success" onclick="{$('#delete_form-' + $('#quiz_delete_dialog_id').val()).submit();}">Yes</button>
            <button id="quiz_delete_no" class="button light" onclick="{$('#quiz_delete_confirm_dialog').fadeOut(300);}">No</button>
        </div>
    </div>
    <div id="main">

        <div id="content" class="full">
            <div class="post manage_forms">
                <div class="content_header">
                    <div class="content_header_title">
                        <div style="float: left">
                            @hasrole('manager')
                            <h2>Exam Management
                            </h2>
                            <p>Create, edit, delete and test your exams</p>
                            @endhasrole
                            @hasrole('student')
                            <h2>Exam Page</h2>
                            @endhasrole
                        </div>
                        @hasrole('manager')
                        <div style="float: right;margin-right: 0px">
                            <a href="{{ url('/exams/create') }}" title="Create New Exam" id="button_create_exam"
                               class="button_primary">
                                <i class="fas fa-plus"></i>Create New Exam
                            </a>
                        </div>
                        @endhasrole
                        <div style="clear: both; height: 1px"></div>
                    </div>
                </div>

                <div class="content_body">
                    <div class="content_body_main ">
                        <ul id="mf_form_list">
                            @if (count($exams) > 0)
                                @foreach($exams as $exam)
                                    <li data-theme_id="{{ $exam->id }}" id="liform_{{ $exam->id }}"
                                        class="form_visible">

                                        <div class="middle_form_bar">
                                            <h3>{{ $exam->name }}</h3>
                                            <div class="form_meta" style="display:none;">


                                                <div class="form_actions">
                                                    <a class="form_actions_toggle" data-formid="{{ $exam->id }}"
                                                       id="form_action_{{ $exam->id }}"
                                                       href="javascript:;"><span class="icon-cog"></span></a>
                                                </div>
                                                <div id="action_toggle_content_{{ $exam->id }}" style="display: none">
                                                    <div class="form_action_item mf_link_delete"><a href="#"><span
                                                                class="icon-trash2"></span> Delete</a></div>

                                                    <div class="form_action_item mf_link_duplicate"><a href="#"><span
                                                                class="icon-copy1"></span> Duplicate</a></div>

                                                    <div class="form_action_item mf_link_disable">
                                                        <a href="#"><span class="icon-pause-circle"></span> Disable</a>
                                                    </div>

                                                    <div class="form_action_item"><a title="View Form Info"
                                                                                     href="form_info.php?id={{ $exam->id }}"><span
                                                                class="icon-file-charts"></span> Info</a></div>

                                                    <div class="form_action_item mf_link_export"><a
                                                            title="Export Form Template"
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
                                            @hasrole('manager')
                                            {{--                                    <div class="form_option">--}}
                                            {{--                                        <a href="{{ url('/exams') }}/{{$exam->id}}/edit"><i class="fas fa-edit"></i>Edit Exam</a>--}}
                                            {{--                                    </div>--}}

                                            <div class="form_option">
                                                <a href="{{ url('/exams') }}/{{$exam->id}}"><i class="far fa-eye"></i>Edit Exam</a>
                                            </div>
                                            <div class="form_option_separator"></div>
                                            <div class="form_option option_expandable">
                                                <a class="mf_link_theme" href="javascript:void(0)"
                                                   onclick="{window.open('{{ url('/preview_exam') }}/{{ $exam->id }}')}" title="Theme"><i
                                                        class="far fa-play-circle"></i><span class="option_text">Test Exam</span></a>
                                            </div>
                                            @endhasrole
                                            @hasrole('student')
                                            <div class="form_option option_expandable">
                                                <a class="mf_link_theme" href="javascript:void(0)"
                                                   onclick="{window.open('{{ url('/preview_exam') }}/{{ $exam->id }}')}" title="Theme"><i
                                                        class="far fa-play-circle"></i><span class="option_text">Start Exam</span></a>
                                            </div>
                                            @endhasrole
                                            @hasrole('manager')
                                            <form method="POST" action="{{ url('/exams') }}/{{ $exam->id }}" id="delete_form-{{ $exam->id }}">
                                                @csrf
                                                @method('DELETE')
                                                <div class="form_option" style="float: right;">
                                                    <button type="button" onclick="{$('#quiz_delete_confirm_dialog').fadeIn(300);$('#quiz_delete_dialog_id').val('{{ $exam->id }}')}"><i class="fas fa-trash"></i>Delete Exam</button>
                                                </div>
                                            </form>
                                            @endhasrole
                                        </div>

                                        <div style="height: 0px; clear: both;"></div>
                                    </li>
                                @endforeach
                            @else
                                <span>No exam</span>
                            @endif
                        </ul>

                    </div>
                </div> <!-- /end of content_body -->

            </div><!-- /.post -->
        </div><!-- /#content -->


        <div class="clear"></div>

    </div>
@endsection
