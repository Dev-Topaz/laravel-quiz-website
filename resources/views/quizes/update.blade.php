<div class="row" style="height: 100%;margin: 0;">
    <div class="cell-9 form_view_element" style="background: #dcdcdc;display: flex;">
        <div style="margin: auto 10px;background: #f1f1f1;width: 100%;padding: 20px;">
            <input id="select_background_img" type="file" hidden>
            <input id="exam_id" type="text"
                   class="form-control @error('exam_id') is-invalid @enderror" name="exam_id"
                   value="{{ $quiz->exam_group->exam_id }}" required autocomplete="exam_id" autofocus
                   hidden>
            <input id="exam_group_id" type="text"
                   class="form-control @error('exam_group_id') is-invalid @enderror" name="exam_group_id"
                   value="{{ $quiz->exam_group->id }}" required autocomplete="exam_group_id" autofocus
                   hidden>
            <input id="background_img" type="text"
                   class="form-control @error('background_img') is-invalid @enderror" name="background_img"
                   value="{{ $quiz->background_img }}" required autocomplete="background_img" autofocus
                   hidden>
            <input id="quiz_id" type="text"
                   class="form-control @error('quiz_id') is-invalid @enderror" name="quiz_id"
                   value="{{ $quiz->id }}" required autocomplete="quiz_id" autofocus
                   hidden>
            <input id="exam_group_id" type="text"
                   class="form-control @error('exam_group_id') is-invalid @enderror" name="exam_group_id"
                   value="{{ $quiz->exam_group_id }}" required autocomplete="exam_group_id" autofocus
                   hidden>
            <input id="type_id" type="text"
                   class="form-control @error('type_id') is-invalid @enderror" name="type_id"
                   value="{{ $quiz->type_id }}" required autocomplete="type_id" autofocus
                   hidden>
            <input id="answer_element" type="text"
                   class="form-control @error('answer_element') is-invalid @enderror"
                   name="answer_element"
                   value="{{ $quiz->answer_element }}" autocomplete="answer_element" autofocus hidden>

            <input id="question_element" type="text"
                   class="form-control @error('question_element') is-invalid @enderror"
                   name="question_element"
                   value="{{ $quiz->question_element }}" autocomplete="question_element" autofocus hidden>

            <input id="answer_content" type="text"
                   class="form-control @error('answer_content') is-invalid @enderror"
                   name="answer_content"
                   value="{{ $quiz->answer }}" autocomplete="answer_content" autofocus hidden>
            <input id="media" type="text"
                   class="form-control @error('media') is-invalid @enderror"
                   name="media"
                   value="{{ $quiz->media }}" autocomplete="media" autofocus hidden>
            <input id="video" type="text"
                   class="form-control @error('video') is-invalid @enderror"
                   name="video"
                   value="{{ $quiz->video }}" autocomplete="video" autofocus hidden>
            <input id="audio" type="text"
                   class="form-control @error('audio') is-invalid @enderror"
                   name="audio"
                   value="{{ $quiz->audio }}" autocomplete="audio" autofocus hidden>
            <input id="media_element" type="text"
                   class="form-control @error('media_element') is-invalid @enderror"
                   name="media_element"
                   value="{{ $quiz->media_element }}" autocomplete="media_element" autofocus hidden>

            <div>
                @switch($quiz->type_id)
                    @case(1)
                    <h4>Multiple Choice Question</h4>
                    @break

                    @case(2)
                    <h4>Multiple Response Question</h4>
                    @break

                    @case(3)
                    <h4>True/False Question</h4>
                    @break

                    @case(4)
                    <h4>Short Answer Question</h4>
                    @break

                    @case(5)
                    <h4>Numeric Question</h4>
                    @break

                    @case(6)
                    <h4>Sequence Question</h4>
                    @break

                    @case(7)
                    <h4>Matching Question</h4>
                    @break

                    @case(8)
                    <h4>Fill in the Blanks Question</h4>
                    @break

                    @case(9)
                    <h4>Select from Lists Question</h4>
                    @break

                    @case(10)
                    <h4>Drag the Words</h4>
                    @break

                    @case(11)
                    <h4>Hotspots Question</h4>
                    @break
                @endswitch
                <div class="row" style="width: 100%;margin: 0;">
                    <div class="cell-9" style="padding: 0;">
                        <div contenteditable="true" id="question"
                             style="overflow-y: scroll;width: 100%;border: 1px solid black;height: 70px;color: black"></div>
                    </div>
                    <div class="cell-3" style="display: flex;align-items: center;justify-content: center;padding: 0;">
                        <div id="form_view_pic_video_element">
                            <a href="javascript:void(0)"
                               style="padding: 0 3px;{{ (isset($quiz->media) || isset($quiz->video)) ? 'display: none' : '' }}"
                               id="form_view_add_picture">Pic</a>
                            <a href="javascript:void(0)"
                               style="padding: 0 3px;{{ (isset($quiz->media) || isset($quiz->video)) ? 'display: none' : '' }}"
                               id="form_view_add_video">Video</a>
                            <img src="{{ $quiz->media ?? '#' }}" alt="form_view_media_element"
                                 id="form_view_media_element"
                                 style="{{ isset($quiz->media) ? 'display: flex' : 'display: none' }};height: 70px"
                                 onclick="show_pic_properties()">
                            <img src="{{ url('/images/add_question.png') }}" alt="" style="padding:0 3px;{{ isset($quiz->video) ? '' : 'display: none' }}" id="form_view_video_element" onclick="show_video_properties()">
                        </div>
                        <a href="javascript:void(0)" style="padding: 0 3px;{{ isset($quiz->audio) ? 'display: none' : '' }}" id="form_view_add_audio">Audio</a>
                        <img src="{{ url('/images/add_question.png') }}" alt="" style="padding:0 3px;{{ isset($quiz->video) ? '' : 'display: none' }}"
                             id="form_view_audio_mark">
                        <input type="file" id="form_view_input_media_element" hidden>
                        <input type="file" id="form_view_input_video_element" hidden>
                        <input type="file" id="form_view_input_audio_element" hidden>
                    </div>
                </div>
            </div>
            <br>

            @switch($quiz->type_id)
                @case(1)
                <h4>Choices</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Correct</th>
                                <th>Choice</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="choice_list">
                            </tbody>
                        </table>
                        <a id="add_choice" style="padding: 10px 0;margin-left: 90px;margin-top: 10px;">Type to add a new
                            choice</a>
                    </div>
                </div>
                @break

                @case(2)
                <h4>Choices</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Correct</th>
                                <th>Choice</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="response_list">
                            </tbody>
                        </table>
                        <a id="add_response" style="padding: 10px 0;margin-left: 90px;margin-top: 10px;">Type to add a
                            new choice</a>
                    </div>
                </div>
                @break

                @case(3)
                <h4>Choices</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Correct</th>
                                <th>Choice</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="choice_list">
                            </tbody>
                        </table>
                        <a id="add_choice" style="padding: 10px 0;margin-left: 90px;margin-top: 10px;">Type to add a new
                            choice</a>
                    </div>
                </div>
                @break

                @case(4)
                <h4>Acceptable Answers</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Acceptable Answer</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="short_answer_list">
                            <tr>
                                <td>
                                    <input id="short_answer" type="text"
                                           class="form-control @error('short_answer') is-invalid @enderror"
                                           name="short_answer"
                                           value="{{ $quiz->answer }}" required autocomplete="short_answer" autofocus>
                                </td>
                                <td><a onclick="{$(this).parent().parent().remove();}"><i
                                            class="fas fa-trash-alt"></i></a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                @break

                @case(5)
                <h4>Acceptable Numeric Values</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Acceptable Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="numeric_list">
                            </tbody>
                        </table>
                        <select name="add_select" id="add_select" style="max-width: 160px;margin-left: 65px;">
                            <option value="+">Add a new condition</option>
                            <option value="==">Equal to</option>
                            <option value="<<">Between</option>
                            <option value=">">Greater than</option>
                            <option value=">=">Greater than or equal to</option>
                            <option value="<">Less than</option>
                            <option value="<=">Less than or equal to</option>
                            <option value="!=">Not equal to</option>
                        </select>
                    </div>
                </div>
                @break

                @case(6)
                <h4>Correct Order</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Choice</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="sequence_list">
                            </tbody>
                        </table>
                        <a id="add_sequence" style="padding: 10px 0;margin-left: 30px;">Type to add a new choice</a>
                    </div>
                </div>
                @break

                @case(7)
                <h4>Correct Matches</h4>
                <div style="height: 216px;overflow-y: scroll;">
                    <div>
                        <table class="table striped" style="margin: 0">
                            <thead>
                            <tr>
                                <th>Item</th>
                                <th></th>
                                <th>Match</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="matching_list">
                            </tbody>
                        </table>
                        <a id="add_matching" style="padding: 10px 0;">Type to add a new
                            choice</a>
                    </div>
                </div>
                @break

                @case(8)
                <div style="display: flex;justify-content: space-between;">
                    <h4>Text with Blanks</h4>
                    <a href="javascript:void(0)" onclick="add_fill_word_dropdown();">Insert Blank</a>
                </div>
                <div contenteditable="true" id="fill_blanks">
                </div>
                @break

                @case(9)
                <div style="display: flex;justify-content: space-between;">
                    <h4>Text with Blanks</h4>
                    <a href="javascript:void(0)" onclick="add_select_lists_dropdown();">Insert Blank</a>
                </div>
                <div contenteditable="true" id="select_lists">
                </div>
                @break

                @case(10)
                <h4>Text with Blanks</h4>
                <div contenteditable="true" style="height: 216px;overflow-y: scroll;border: 1px solid black"
                     id="drag_words">
                </div>
                @break

                @case(11)
                <div class="hotspots_content">
                    <div class="row" id="hotspots_two_columns"
                         style="{{ $quiz->answer == '' ? 'display:none' : 'display:flex'}};flex-direction: row;max-width: 100%;margin: 0">
                        <div class="cell-6">
                            <h4>Hotspot</h4>
                            <div
                                style="border: 1px solid gray;height: 216px;display: flex;align-content: center;justify-content: center;align-items: center;">
                                <div>
                                    <div style="display: flex;justify-content: center;">Choose hotspot shape</div>
                                    <div style="display: flex;">
                                        <a style="padding: 10px;margin: 0 5px;border: 1px dotted gray;"
                                           onclick="drawrec()">Rectangle</a>
                                        <a style="padding: 10px;margin: 0 5px;border: 1px dotted gray;"
                                           onclick="drawcle()">Circle</a>
                                        <a style="padding: 10px;margin: 0 5px;border: 1px dotted gray;"
                                           onclick="drawpoly()">Freedom</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cell-6">
                            <h4>Picture</h4>
                            <div style="border: 1px solid gray;" id="hotspots_image_canvas">
                                <canvas id="hotspots_canvas" height="214" width="287.5"></canvas>
                            </div>
                        </div>
                        <div style="float: right;"><a href="javascript:void(0)" style="padding: 0 10px"
                                                      onclick="hotspots_change_picture()">Change
                                Picture</a><a href="javascript:void(0)" onclick="deleteCanvas()"
                                              style="padding: 0 10px">Delete Shape</a></div>
                    </div>
                    <div id="hotspots_one_column"
                         style="flex-direction: column;{{ $quiz->answer == '' ? 'display:flex' : 'display:none'}}">
                        <h4>Hotspots</h4>
                        <div id="hotspots">
                            <div id="hotspots_only_from_files">
                                <h5>Add Picture</h5>
                                <div class="from_files">From File...</div>
                                <form action="{{ url('/hotspots_image_upload') }}" method="post" id="upload-image-form"
                                      enctype="multipart/form-data" style="display: none;">
                                    @csrf
                                    <div class="form-group">
                                        <input type="file" name="hotspots_only_from_files_image"
                                               placeholder="Choose image"
                                               id="hotspots_only_from_files_image" hidden>
                                        <span class="text-danger" id="image-input-error"></span>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success"
                                                id="hotspots_only_from_files_upload_button">Upload
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                @break

            @endswitch

            <br>

            <h4>Feedback and Branching</h4>
            <table class="table striped feedback_branching" style="margin: 0">
                <thead>
                <tr>
                    <th></th>
                    <th>Feedback</th>
                    <th>Branching</th>
                    <th>Score</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Correct:</td>
                    <td><label class="choice_label" data-editable>{{ $quiz->feedback_correct }}</label></td>
                    <td></td>
                    <td><label class="choice_label" data-editable>{{ $quiz->correct_score }}</label></td>
                </tr>
                <tr>
                    <td>Incorrect:</td>
                    <td><label class="choice_label" data-editable>{{ $quiz->feedback_incorrect }}</label></td>
                    <td></td>
                    <td><label class="choice_label" data-editable>{{ $quiz->incorrect_score }}</label></td>
                </tr>
                @if ($quiz->feedback_try_again != null)
                    <tr>
                        <td>Try Again:</td>
                        <td><label class="choice_label" data-editable>{{ $quiz->feedback_try_again }}</label></td>
                        <td>None</td>
                        <td><label class="choice_label" data-editable>{{ $quiz->try_again_score }}</label></td>
                    </tr>
                @endif
                </tbody>
            </table>
        </div>
    </div>
    <div class="cell-9 slide_view_element" style="background: #dcdcdc;display: none;overflow: scroll">
        <div
            style="top:50%;left:50%;transform:translate(-50%, -50%);margin: auto 0;width: {{ $quiz->exam_group->exam->screen_width }}px;height:{{ $quiz->exam_group->exam->screen_height }}px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}"
            id="slide_view_container">
            <div id="quiz_background_container"
                 style="width: 100%;height:100%;padding: 20px;{{ isset($quiz->background_img) ? ('background-image:' . $quiz->background_img . ';') : '' }}">
                {!! $quiz->question_element !!}
                {!! $quiz->answer_element !!}
                @if (isset($quiz->media))
                    {!! $quiz->media_element !!}
                @else
                    <div class="slide_view_media_element slide_view_group" style="z-index: 3;display: none;">
                        <img src="#" alt="slide_view_media" style="width: 100%;height: 100%;">
                    </div>
                @endif
            </div>
        </div>
    </div>
    <div class="cell-3 slide_option" style="padding: 0 20px;">
        <h3 style="border-bottom: 1px dotted grey;padding: 15px 10px;">Slide Options</h3>
        <div>
            <div>
                <div class="row" style="padding: 0 10px;">
                    <div class="cell-5">
                        <label for="question_type" style="font-size: 16px;">Question type:</label>
                    </div>
                    <div class="cell-7">
                        <select data-role="select" data-filter="false" id="question_type">
                            <option value="graded" {{ $quiz->question_type == 'graded' ? 'selected' : '' }}>Graded
                            </option>
                            <option value="survey" {{ $quiz->question_type == 'survey' ? 'selected' : '' }}>Survey
                            </option>
                        </select>
                    </div>
                </div>
                <div id="slide_details" style="padding: 10px 10px 0 20px">
                    <div class="row">
                        <div class="cell-6">
                            <label for="feedback" name="feedback">Feedback:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" id="feedback">
                                <option value="none" {{ $quiz->feedback_type == 'none' ? 'selected' : '' }}>None
                                </option>
                                <option value="by_result" {{ $quiz->feedback_type == 'by_result' ? 'selected' : '' }}>By
                                    Result
                                </option>
                                <option value="by_choice" {{ $quiz->feedback_type == 'by_choice' ? 'selected' : '' }}>By
                                    Choice
                                </option>
                            </select>
                        </div>
                        @if (isset($quiz->branching))
                            <div class="cell-6">
                                <label for="branching" name="branching">Branching:</label>
                            </div>
                            <div class="cell-6">
                                <select data-role="select" data-filter="false" id="branching">
                                    <option
                                        value="by_result" {{ $quiz->feedback_type == 'by_result' ? 'selected' : '' }}>By
                                        Result
                                    </option>
                                    <option
                                        value="by_choice" {{ $quiz->feedback_type == 'by_choice' ? 'selected' : '' }}>By
                                        Choice
                                    </option>
                                </select>
                            </div>
                        @endif
                        <div class="cell-6">
                            <label for="score" name="score">Score:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false"
                                    id="score" {{ !isset($quiz->score) ? 'disabled' : '' }}>
                                <option value="by_result" {{ $quiz->score == 'by_result' ? 'selected' : '' }}>By
                                    Result
                                </option>
                                <option value="by_choice" {{ $quiz->score == 'by_choice' ? 'selected' : '' }}>By
                                    Choice
                                </option>
                            </select>
                        </div>
                        <div class="cell-6">
                            <label for="attempts" name="attempts">Attempts:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" id="attempts">
                                <option value="1" {{ $quiz->attempts == '1' ? 'selected' : '' }}>1</option>
                                <option value="2" {{ $quiz->attempts == '2' ? 'selected' : '' }}>2</option>
                                <option value="3" {{ $quiz->attempts == '3' ? 'selected' : '' }}>3</option>
                                <option value="4" {{ $quiz->attempts == '4' ? 'selected' : '' }}>4</option>
                                <option value="5" {{ $quiz->attempts == '5' ? 'selected' : '' }}>5</option>
                                <option value="6" {{ $quiz->attempts == '6' ? 'selected' : '' }}>6</option>
                                <option value="7" {{ $quiz->attempts == '7' ? 'selected' : '' }}>7</option>
                                <option value="8" {{ $quiz->attempts == '8' ? 'selected' : '' }}>8</option>
                                <option value="9" {{ $quiz->attempts == '9' ? 'selected' : '' }}>9</option>
                                <option value="10" {{ $quiz->attempts == '10' ? 'selected' : '' }}>10</option>
                                <option value="unlimited" {{ $quiz->attempts == 'unlimited' ? 'selected' : '' }}>
                                    Unlimited
                                </option>
                            </select>
                        </div>
                        <div class="cell-7">
                            <input type="checkbox" data-role="checkbox" id="is_limit_time"
                                   data-caption="Limit time to answer the question:" {{ $quiz->is_limit_time ? 'checked' : '' }}>
                        </div>
                        <div class="cell-5">
                            <input class="mt-1" type="time" data-role="input" id="limit_time"
                                   {{ $quiz->is_limit_time ? '' : 'disabled' }}
                                   data-clear-button="false"
                                   value="{{ $quiz->is_limit_time ? $quiz->limit_time : '01:00' }}">
                        </div>
                        @if (isset($quiz->shuffle_answers))
                            <div class="cell-12">
                                <input type="checkbox" data-role="checkbox" id="shuffle_answers"
                                       data-caption="Shuffle answers" {{ $quiz->shuffle_answers ? 'checked' : '' }}>
                            </div>
                        @endif
                        @if (isset($quiz->partially_correct))
                            <div class="cell-12">
                                <input type="checkbox" data-role="checkbox" id="partially_correct"
                                       data-caption="Accept partially correct answer" {{ $quiz->partially_correct ? 'checked' : '' }}>
                            </div>
                        @endif
                        @if (isset($quiz->limit_number_response))
                            <div class="cell-12">
                                <input type="checkbox" data-role="checkbox" id="limit_number_response"
                                       data-caption="Limit number of response" {{ $quiz->limit_response ? 'checked' : '' }}>
                            </div>
                        @endif
                        @if (isset($quiz->case_sensitive))
                            <div class="cell-12">
                                <input type="checkbox" data-role="checkbox" id="case_sensitive"
                                       data-caption="Case sensitive" {{ $quiz->case_sensitive ? 'checked' : '' }}>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="form_view_element">preview</div>
            <div class="slide_view_element" style="display: none">Slide Layer</div>
            <input type="text" id="target_element" value="" hidden>
        </div>
    </div>
    <div class="cell-3 picture_properties" style="padding: 0 20px;display: none;">
        <div style="display: flex;justify-content: space-around;align-items: center;">
            <h3 style="border-bottom: 1px dotted grey;padding: 15px 10px;">Picture Properties</h3>
            <p style="color: gray;font-size: 18px;" onclick="close_pic_properties()">x</p>
        </div>
        <div style="width: 100%;" id="picture_properties_image">
            <img src="" alt="">
        </div>
        <div style="display: flex;justify-content: space-around;">
            <a href="javascript:void(0)" style="padding:5px" onclick="change_media_pic()">Change</a>
            <a href="javascript:void(0)" style="padding:5px" onclick="delete_media_pic()">Delete</a>
        </div>
    </div>
    <div class="cell-3 video_properties" style="padding: 0 20px;display: none;">
        <div style="display: flex;justify-content: space-around;align-items: center;">
            <h3 style="border-bottom: 1px dotted grey;padding: 15px 10px;">Video Properties</h3>
            <p style="color: gray;font-size: 18px;" onclick="close_video_properties()">x</p>
        </div>
        <div style="width: 100%;" id="video_properties_video">
            <video controls="controls">
                <source src="" type="video/mp4">
            </video>
        </div>
        <div style="display: flex;justify-content: space-around;">
            <a href="javascript:void(0)" style="padding:5px" onclick="change_video()">Change</a>
            <a href="javascript:void(0)" style="padding:5px" onclick="delete_video()">Delete</a>
        </div>
    </div>
    <div class="cell-3 audio_properties" style="padding: 0 20px;display: none;">
        <div style="display: flex;justify-content: space-around;align-items: center;">
            <h3 style="border-bottom: 1px dotted grey;padding: 15px 10px;">Audio Properties</h3>
            <p style="color: gray;font-size: 18px;" onclick="close_audio_properties()">x</p>
        </div>
        <div style="width: 100%;" id="audio_properties">
            <audio controls="controls">
                <source src="" type="audio/mpeg">
            </audio>
        </div>
        <div style="display: flex;justify-content: space-around;">
            <a href="javascript:void(0)" style="padding:5px" onclick="change_audio()">Change</a>
            <a href="javascript:void(0)" style="padding:5px" onclick="delete_audio()">Delete</a>
        </div>
    </div>
</div>

<script>
    // $('.slide_view_question_element').click(function (evt) {
    //     console.log(evt.pageX - $(this).offset().left);
    //     if(evt.pageX - $(this).offset().left > 10) $(this).draggable({disabled: true});
    //     else $(this).draggable();
    // });
    // $('.slide_view_question_element').mouseup(function () {
    //     console.log("mouseup");
    //     $(this).draggable({disabled: true});
    // });
    $('.slide_view_group').draggable();
    $('.slide_view_group').resizable();

    answer_slide2form($('#answer_element').val(), $('#answer_content').val());
    $('#question').html(question_slide2form($('#question_element').val()));

</script>

<script src="{{ asset('js/multiple_choice.js') }}" defer></script>
<script src="{{ asset('js/multiple_response.js') }}" defer></script>
<script src="{{ asset('js/numeric.js') }}" defer></script>
<script src="{{ asset('js/sequence.js') }}" defer></script>
<script src="{{ asset('js/matching.js') }}" defer></script>
<script src="{{ asset('js/fill_blanks.js') }}" defer></script>
<script src="{{ asset('js/select_lists.js') }}" defer></script>
<script src="{{ asset('js/hotspots.js') }}" defer></script>
<script src="{{ asset('js/form_add_media_audio.js') }}" defer></script>
