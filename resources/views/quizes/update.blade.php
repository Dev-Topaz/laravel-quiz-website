<div class="row" style="height: 100%;margin: 0;">
    <div class="cell-8 form_view_element" style="background: #dcdcdc;display: flex;">
        <div style="margin: auto 10px;background: #f1f1f1;width: 100%;padding: 20px;">
            <input id="exam_id" type="text"
                   class="form-control @error('exam_id') is-invalid @enderror" name="exam_id"
                   value="{{ $quiz->exam_group->exam_id }}" required autocomplete="exam_id" autofocus
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

            <div>
                <h4>Multiple Choice Question</h4>
                <div contenteditable="true" id="question"
                     style="overflow-y: scroll;width: 100%;border: 1px solid black;height: 70px;color: black"></div>
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
    <div class="cell-8 slide_view_element" style="background: #dcdcdc;display: none;">
        <div
            style="margin: auto 0;width: 100%;height:500px;padding: 20px;{{ $quiz->exam_group->exam->theme_style ?? 'background:white' }}"
            id="slide_view_container">
            {!! $quiz->question_element !!}
            {!! $quiz->answer_element !!}
            @if ($quiz->media != null)
                <div class="slide_view_media_element slide_view_group"></div>
            @endif
        </div>
    </div>
    <div class="cell-4 slide_option" style="padding: 0 20px;">
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
