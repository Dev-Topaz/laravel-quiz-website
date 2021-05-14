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

        case '5':
            console.log(answer_content);
            let numeric_answer_array = answer_content.split('@');
            numeric_answer_array.pop();

            let numeric_item;
            for (let i = 0; i < numeric_answer_array.length; i++) {
                numeric_item = numeric_answer_array[i].split(';');
                numeric_item.pop();
                form_answer += '<tr><td><div class="select_numeric_item" style="display: flex;padding: 5px 0;"><label for="' + (i + 1) + '">Value is: </label><select onchange="{select_change(this);}" name="' + (i + 1) + '"id="' + (i + 1) + '" style="max-width: 160px;"><option value="==" ' + (numeric_item[0] === '==' ? 'selected' : '') + '>Equal to</option><option value="<<" ' + (numeric_item[0] === '<<' ? 'selected' : '') + '>Between</option><option value=">" ' + (numeric_item[0] === '>' ? 'selected' : '') + '>Greater than</option><option value=">=" ' + (numeric_item[0] === '>=' ? 'selected' : '') + '>Greater than or equal to</option><option value="<" ' + (numeric_item[0] === '<' ? 'selected' : '') + '>Less than</option><option value="<=" ' + (numeric_item[0] === '<=' ? 'selected' : '') + '>Less than or equal to</option><option value="!=" ' + (numeric_item[0] === '!=' ? 'selected' : '') + '>Not equal to</option></select><div style="display: flex;"><input type="number" value="' + numeric_item[1] + '" style="max-width: 100px;">' + (numeric_item[0] === '<<' ? '<span>and</span><input type="number" value="' + numeric_item[2] + '" style="max-width: 100px;">' : '') + '</div></div></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
            }
            $('#numeric_list').html(form_answer);
            break;

        case '6':
            console.log(answer_content);
            let sequence_answer_array = answer_content.split(';');
            sequence_answer_array.pop();

            for (let i = 0; i < sequence_answer_array.length; i++) {
                form_answer += '<tr class="sequence_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>' + sequence_answer_array[i] + '</label><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
            }
            $('#sequence_list').html(form_answer);
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
            slide_answer_element = '<input id="answer" type="text" class="form-control" name="answer" autocomplete="answer">';
            break;

        case '5':
            slide_answer_element = '<input id="answer" type="number" class="form-control" name="answer" autocomplete="answer">';
            break;

        case '6':
            answer_element = $('tbody#sequence_list tr');
            slide_answer_element = '<ul id="sortable">';
            for (let i = 0; i < answer_element.length; i++) {
                slide_answer_element += '<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>' + answer_element.eq(i).find('label').html() + '</label></li>';
            }
            slide_answer_element += '</ul>';
            break;
    }

    $('.slide_view_answer_element').html('<div class="col-md-12">' + slide_answer_element + '</div>');
}

// answer_slide2form($('#answer_element').val(), $('#answer_content').val());
// $('#question').html(question_slide2form($('#question_element').val()));

function answer_store() {
    const typeId = $('#type_id').val();

    let answer = "";
    switch (typeId) {
        case '1':
            var selected = $("input[type='radio'][name='answer']:checked");
            if (selected.length > 0) {
                answer = selected.val();
            }
            break;

        case '2':
            var selected = $("input[type='checkbox'][name='answer']:checked");
            for (const selectedElement of selected) {
                console.log($(selectedElement).val());
                answer += $(selectedElement).val() + ';';
            }
            break;

        case '3':
            var selected = $("input[type='radio'][name='answer']:checked");
            if (selected.length > 0) {
                answer = selected.val();
            }
            console.log(answer);
            break;

        case '4':
            answer = $('#short_answer').val();
            console.log(answer);
            break;

        case '5':
            const select_items = $('.select_item');
            let select_input_items;
            for (let i = 0; i < select_items.length; i++) {
                answer += select_items.eq(i).find('select').val() + ';';
                select_input_items = select_items.eq(i).find('input');
                for (let j = 0; j < select_input_items.length; j++) {
                    answer += select_input_items.eq(j).val() + ';';
                }
                answer += '@';
            }
            break;

        case '6':
            answer_element = $('tbody#sequence_list tr');
            for (let i = 0; i < answer_element.length; i++) {
                answer += answer_element.eq(i).find('label').html() + ';';
            }
            break;
    }

    $('#answer_content').val(answer);
}

function slide_to_form() {
    console.log("slide2form");

    answer_slide2form($('.slide_view_answer_element')[0].outerHTML, $('#answer_content').val());
    $('#question').html(question_slide2form($('.slide_view_question_element')[0].outerHTML));
}

function form_to_slide() {
    console.log("form2slide");

    question_form2slide();
    answer_form2slide();
    answer_store();
}

function store_theme_style(style) {
    console.log(style);
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const examId = $('#exam_id').val();
    $.post(root_url + "/update_theme_style", {
            '_token': token,
            'exam_id': examId,
            'style': style,
        },
        function (data, status) {
            console.log(data, status);
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });
}
