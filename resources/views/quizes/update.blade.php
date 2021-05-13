<div class="row" style="height: 100%;margin: 0;">
    <div class="cell-8 form_view_element" style="background: #dcdcdc;display: flex;">
        <div style="margin: auto 10px;background: #f1f1f1;width: 100%;padding: 20px;">
            <input id="exam_group_id" type="text"
                   class="form-control @error('exam_group_id') is-invalid @enderror" name="exam_group_id"
                   value="{{ $quiz->exam_group_id }}" required autocomplete="exam_id" autofocus
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
                                           class="form-control @error('short_answer') is-invalid @enderror" name="short_answer"
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
        <div style="margin: auto 0;background: #f1f1f1;width: 100%;height:500px;padding: 20px;">
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

{{--<script src="{{ asset('js/texteditor.js') }}" defer></script>--}}
<script src="{{ asset('js/multiple_choice.js') }}" defer></script>
<script src="{{ asset('js/multiple_response.js') }}" defer></script>
<script src="{{ asset('js/ribbon_bar.js') }}" defer></script>
<script>
    $("body").click(function (e) {
        if (jQuery.inArray('slide_view_question_element', e.target.classList) !== -1 || $(e.target).parents(".slide_view_question_element").length) {
            console.log('slide_view_question_element');
            $('#target_element').val('slide_view_question_element');
            return;
        }
        if (jQuery.inArray('slide_view_answer_element', e.target.classList) !== -1 || $(e.target).parents(".slide_view_answer_element").length) {
            console.log('slide_view_answer_element');
            $('#target_element').val('slide_view_answer_element');
            return;
        }
        if (jQuery.inArray('slide_view_media_element', e.target.classList) !== -1 || $(e.target).parents(".slide_view_media_element").length) {
            console.log('slide_view_media_element');
            $('#target_element').val('slide_view_media_element');
            return;
        }
        $('#target_element').val('common_element');
        return;
    });

    $('.slide_view_group').draggable();
    $('.slide_view_group').resizable();

    function question_slide2form(question) {
        const element = $(question);
        return element.html();
    }

    function question_form2slide() {
        $('.slide_view_question_element').html($('#question').html());
    }

    function answer_slide2form(answer_element, answer_content) {
        const typeId = $('#type_id').val();
        const element = $(answer_element);

        let form_answer = '';
        switch (typeId) {
            case '1':
                for (let i = 0; i < element.find('.choice_item').length; i++) {
                    const value = element.find('.choice_item').eq(i).find('input').attr('value');
                    form_answer += '<tr class="choice_item"><td><input type="radio" name="answer" value="' + value + '" ' + (value == answer_content ? 'checked' : '') + '></td><td><label class="choice_label" data-editable for="' + element.find('.choice_item').eq(i).find('label').attr('for') + '">' + element.find('.choice_item').eq(i).find('label').html() + '</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
                }
                $('#choice_list').html(form_answer);
                break;

            case '2':
                let answer_array = answer_content.split(';');
                answer_array.pop();
                for (let i = 0; i < element.find('.response_item').length; i++) {
                    const value = element.find('.response_item').eq(i).find('input').attr('value');
                    form_answer += '<tr class="response_item"><td><input type="checkbox" name="answer" value="' + value + '" ' + (answer_array.indexOf(value) !== -1 ? 'checked' : '') + '></td><td><label class="choice_label" data-editable for="' + element.find('.response_item').eq(i).find('label').attr('for') + '">' + element.find('.response_item').eq(i).find('label').html() + '</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
                }
                $('#response_list').html(form_answer);
                break;

            case '3':
                form_answer = '<tr class="choice_item"><td><input type="radio" id="true" name="answer" value="1" style="padding-right: 10px;" ' + (answer_content === '1' ? 'checked' : '') + '></td><td><label for="true">True</label></td><td></td></tr><tr class="choice_item"><td><input type="radio" id="false" name="answer" value="0" style="padding-right: 10px;" ' + (answer_content === '1' ? '' : 'checked') + '></td><td><label for="false">False</label><td></td></tr>';
                $('#choice_list').html(form_answer);
                break;

            default:
        }

        return form_answer;
    }

    function answer_form2slide() {
        const typeId = $('#type_id').val();
        let answer_element;
        let slide_answer_element = '';
        let element;
        switch (typeId) {
            case '1':
                answer_element = $('#choice_list')[0].outerHTML;
                element = $(answer_element);
                for (const item of element.find('tr')) {
                    const value = $(item).find('input').attr('value');
                    const label = $(item).find('label').html();
                    slide_answer_element += '<div class="choice_item"><input type="radio" id="' + value + '" name="answer" value="' + value + '" style="padding-right: 10px;"><label for="' + value + '">' + label + '</label></div>';
                }
                break;

            case '2':
                answer_element = $('#response_list')[0].outerHTML;
                element = $(answer_element);
                for (const item of element.find('tr')) {
                    const value = $(item).find('input').attr('value');
                    const label = $(item).find('label').html();
                    slide_answer_element += '<div class="response_item"><input type="checkbox" id="' + value + '" name="answer" value="' + value + '" style="padding-right: 10px;"><label for="' + value + '">' + label + '</label></div>';
                }
                break;

            case '3':
                slide_answer_element = '<div class="choice_item"><input type="radio" id="true" name="answer" value="1" style="padding-right: 10px;"><label for="true">True</label></div><div class="choice_item"><input type="radio" id="false" name="answer" value="0" style="padding-right: 10px;"><label for="0">False</label></div>';
                break;

            case '4':
                slide_answer_element = '<input id="answer" type="text" class="form-control is-invalid " name="answer" autocomplete="answer">';
                break;
        }

        $('.slide_view_answer_element').html('<div class="col-md-12">' + slide_answer_element + '</div>');
    }

    answer_slide2form($('#answer_element').val(), $('#answer_content').val());
    $('#question').html(question_slide2form($('#question_element').val()));

    function slide_to_form() {
        console.log("slide2form");

        answer_slide2form($('.slide_view_answer_element')[0].outerHTML, $('#answer_content').val());
        $('#question').html(question_slide2form($('.slide_view_question_element')[0].outerHTML));
    }

    function form_to_slide() {
        console.log("form2slide");

        question_form2slide();
        answer_form2slide();
    }
</script>
