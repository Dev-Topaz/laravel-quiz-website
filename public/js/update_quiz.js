function question_slide2form(question) {
    const element = $(question);
    element.removeClass('.selected_slide_view_group');
    element.children('.ui-resizable-handle').remove();
    element.children('input[type=checkbox]').remove();

    return element.html();
}

function question_form2slide() {
    $('#quiz_view .slide_view_question_element > div.cancel_drag').html($('#question > div.cancel_drag').eq(0).html());
}

// function media_form2slide() {
//     if ($('#media_element').val() == '') return;
//     $('.slide_view_media_element').remove();
//     $('#quiz_background_container').append($('#media_element').val());
// }
//
// function media_slide2form() {
//     $('#media_element').val($('.slide_view_media_element')[0].outerHTML);
// }

function answer_slide2form(answer_element, answer_content) {
    const typeId = $('#type_id').val();
    const element = $(answer_element)

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
            let numeric_answer_array = answer_content.split('@');
            numeric_answer_array.pop();

            let numeric_item;
            for (let i = 0; i < numeric_answer_array.length; i++) {
                numeric_item = numeric_answer_array[i].split(';');
                numeric_item.pop();
                form_answer += '<tr><td><div class="select_item" style="display: flex;padding: 5px 0;"><label for="' + (i + 1) + '">Value is: </label><select onchange="{select_change(this);}" name="' + (i + 1) + '"id="' + (i + 1) + '" style="max-width: 160px;"><option value="==" ' + (numeric_item[0] === '==' ? 'selected' : '') + '>Equal to</option><option value="<<" ' + (numeric_item[0] === '<<' ? 'selected' : '') + '>Between</option><option value=">" ' + (numeric_item[0] === '>' ? 'selected' : '') + '>Greater than</option><option value=">=" ' + (numeric_item[0] === '>=' ? 'selected' : '') + '>Greater than or equal to</option><option value="<" ' + (numeric_item[0] === '<' ? 'selected' : '') + '>Less than</option><option value="<=" ' + (numeric_item[0] === '<=' ? 'selected' : '') + '>Less than or equal to</option><option value="!=" ' + (numeric_item[0] === '!=' ? 'selected' : '') + '>Not equal to</option></select><div style="display: flex;"><input type="number" value="' + numeric_item[1] + '" style="max-width: 100px;">' + (numeric_item[0] === '<<' ? '<span>and</span><input type="number" value="' + numeric_item[2] + '" style="max-width: 100px;">' : '') + '</div></div></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
            }
            $('#numeric_list').html(form_answer);
            break;

        case '6':
            let sequence_answer_array = answer_content.split(';');
            sequence_answer_array.pop();

            for (let i = 0; i < sequence_answer_array.length; i++) {
                form_answer += '<tr class="sequence_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>' + sequence_answer_array[i] + '</label><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
            }
            $('#sequence_list').html(form_answer);
            break;

        case '7':
            let matching_answer_array = answer_content.split('@');
            matching_answer_array.pop();

            for (let i = 0; i < matching_answer_array.length; i++) {
                form_answer += '<tr class="matching_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="matching_item_label" data-editable>' + matching_answer_array[i].split(';')[0] + '</label></td><td></td><td><label class="matching_label" data-editable>' + matching_answer_array[i].split(';')[1] + '</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';
            }

            $('#matching_list').html(form_answer);
            break;

        case '8':

            let fill_blanks_array = answer_content.split('@');
            fill_blanks_array.pop();
            const fill_blank_slide_answer_html = $('.slide_view_answer_element').html();
            let form_answer_element = $(fill_blank_slide_answer_html).eq(0);

            let fill_blanks_item_array;
            for (let i = 0; i < fill_blanks_array.length; i++) {

                let element = '<div class="fill_blanks_dropdown_content"></div><div class="fill_blanks_dropdown_arrow" onclick="{$(this).next().toggle();}"><i class="fas fa-chevron-down"></i></div><div class="fill_blanks_dropdown_menu" contenteditable="false"><ul>';

                fill_blanks_item_array = fill_blanks_array[i].split(';');
                fill_blanks_item_array.pop();

                for (let j = 0; j < fill_blanks_item_array.length; j++) {
                    element += '<li><label data-editable>' + fill_blanks_item_array[j] + '</label><a onclick="{$(this).parent().remove();}"><i class="fas fa-trash-alt"></i></a></li>'
                }

                element += '<li><i onclick="add_word($(this));">Add a new word</i></li></ul></div>';

                form_answer_element.find('.fill_blanks_dropdown_body').eq(i).html(element);
            }
            form_answer = form_answer_element.html() + '&nbsp';
            $('#fill_blanks').html(form_answer);
            break;

        case '9':

            let select_lists_array = answer_content.split(';');
            select_lists_array.pop();
            const select_lists_slide_answer_html = $('.slide_view_answer_element').html();
            let select_lists_form_answer_element = $(select_lists_slide_answer_html).eq(0);

            let select_lists_item_array;
            for (let i = 0; i < select_lists_array.length; i++) {

                select_lists_item_array = select_lists_form_answer_element.find('.select_lists_dropdown_body').eq(i).find('option');

                let element = '<div class="select_lists_dropdown_content"></div><div class="select_lists_dropdown_arrow" onclick="{$(this).next().toggle();}"><i class="fas fa-chevron-down"></i></div><div class="select_lists_dropdown_menu" contenteditable="false"><ul>';

                for (let j = 1; j < select_lists_item_array.length; j++) {
                    element += '<li><div><input type="radio" name="' + i + '" value="' + select_lists_item_array.eq(j).html() + '"' + (select_lists_item_array.eq(j).attr('value') === select_lists_array[i] ? 'checked' : '') + '><label data-editable>' + select_lists_item_array.eq(j).html() + '</label></div><a onclick="{$(this).parent().remove();}"><i class="fas fa-trash-alt"></i></a></li>';
                }

                element += '<li><i onclick="add_select_lists_word($(this));">Add a new word</i></li></ul></div>';

                select_lists_form_answer_element.find('.select_lists_dropdown_body').eq(i).html(element);
            }

            form_answer = select_lists_form_answer_element.html() + '&nbsp';
            $('#select_lists').html(form_answer);
            break;

        case '10':
            let drag_words_array = answer_content.split(';');
            drag_words_array.pop();
            const slide_drag_words_question = $('#slide_drag_words_question')[0].outerHTML;
            const form_answer_input_element = $(slide_drag_words_question);
            for (let i = 0; i < form_answer_input_element.find('.blank').length; i++) {
                form_answer_input_element.find('.blank').eq(i).html('<input style="max-width: 70px;" id="' + i + '" value="' + drag_words_array[i] + '">');
                form_answer_input_element.find('.blank').eq(i).css('padding-right', 0);
            }
            form_answer = form_answer_input_element.html();
            $('#drag_words').html(form_answer);
            break;

        case '12':
            $('#info_slide').html($(answer_element).find('.cancel_drag').html());
            break;

        case '13':
            $('#quiz_instructions').html($(answer_element).find('.cancel_drag').html());
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

        case '7':
            answer_element = $('tbody#matching_list tr');
            for (let i = 0; i < answer_element.length; i++) {
                slide_answer_element += '<div style="display: flex;justify-content: space-around;padding-bottom: 10px;"><div class="ui-widget-header droppable" style="width: 40%"><p>' + $('tbody#matching_list tr').eq(i).find('label').eq(0).html() + '</p></div><div class="ui-widget-content draggable" style="width: 40%" isdropped=false><p>' + $('tbody#matching_list tr').eq(i).find('label').eq(1).html() + '</p></div></div>';
            }
            break;

        case '8':
            answer_element = $('#fill_blanks')[0].outerHTML;

            let fill_blanks_slide_element = $(answer_element);

            const fill_blanks_dropdown_elements = fill_blanks_slide_element.find('.fill_blanks_dropdown_body');

            for (let i = 0; i < fill_blanks_dropdown_elements.length; i++) {
                fill_blanks_dropdown_elements.eq(i).html('<input type="text" id="' + i + '" style="max-width: 100px;">');
            }

            slide_answer_element = fill_blanks_slide_element.html();
            break;

        case '9':
            answer_element = $('#select_lists')[0].outerHTML;

            let select_lists_slide_element = $(answer_element);

            const select_lists_dropdown_elements = select_lists_slide_element.find('.select_lists_dropdown_body');

            let select_element;
            for (let i = 0; i < select_lists_dropdown_elements.length; i++) {
                select_element = '<select id="' + i + '"><option value="none">- Select -</option>';
                // <option value="answer 1">Answer 1</option><option value="answer 2">Answer 2</option></select>';
                for (let j = 0; j < select_lists_dropdown_elements.eq(i).find('label').length; j++) {
                    select_element += '<option value="' + select_lists_dropdown_elements.eq(i).find('label').eq(j).html() + '">' + select_lists_dropdown_elements.eq(i).find('label').eq(j).html() + '</option>';
                }
                select_element += '</select>'
                select_lists_dropdown_elements.eq(i).html(select_element);
            }
            slide_answer_element = select_lists_slide_element.html();
            break;

        case '10':
            answer_element = $('#drag_words')[0].outerHTML;
            const form_answer_input_element = $(answer_element);
            let word_array = '';
            for (let i = 0; i < form_answer_input_element.find('.blank').length; i++) {
                word_array += '<span style="border: 1px solid gray;background: white;color: black;">' + $('#drag_words .blank input').eq(i).val() + '</span>'
                form_answer_input_element.find('.blank').eq(i).html('');
                form_answer_input_element.find('.blank').eq(i).css('padding-right', '70px');
            }
            form_answer = form_answer_input_element.html();
            $('#quiz_view #slide_drag_words_question').html(form_answer);
            $('#quiz_view #slide_drag_words_answer').html(word_array);
            break;

        case '11':
            const root_url = $('meta[name=url]').attr('content');
            var slide_view_canvas = new fabric.Canvas('slide_view_hotspots_canvas');

            var canvas_info = $('#answer_content').val();

            if (canvas_info == '@{}') return;

            var canvas_bg_url = canvas_info.split('@')[0];
            var canvas_item_info = canvas_info.split('@')[1];

            var json_bg_url = JSON.parse(canvas_bg_url);
            var json_canvas_item = JSON.parse(canvas_item_info);

            fabric.Image.fromURL(root_url + '/' + json_bg_url.background, function (img) {
                slide_view_canvas.setBackgroundImage(img, slide_view_canvas.renderAll.bind(slide_view_canvas), {
                    scaleX: slide_view_canvas.width / img.width,
                    scaleY: slide_view_canvas.height / img.height
                });
            });

            if (json_canvas_item.type === 'circle') {

                slide_view_canvas.add(new fabric.Circle({
                    radius: json_canvas_item.radius,
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580',
                    originX: 'center',
                    originY: 'center',
                    top: json_canvas_item.top,
                    left: json_canvas_item.left
                }));
            }

            if (json_canvas_item.type === 'rect') {

                slide_view_canvas.add(new fabric.Rect({
                    width: json_canvas_item.width,
                    height: json_canvas_item.height,
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580',
                    top: json_canvas_item.top,
                    left: json_canvas_item.left
                }));
            }

            if (json_canvas_item.type === 'polyline') {

                slide_view_canvas.add(new fabric.Polygon(json_canvas_item.points, {
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580'
                }));
            }
            break;

        case '12':
            slide_answer_element += '<div contenteditable="true" class="cancel_drag">' + $('#info_slide').html() + '</div>';
            break;

        case '13':
            slide_answer_element += '<div contenteditable="true" class="cancel_drag">' + $('#quiz_instructions').html() + '</div>';
            break;

        case '14':
            slide_answer_element = $($('#answer_content').val()).find('.col-md-12').html();
            break;

        case '15':
            slide_answer_element = $($('#answer_content').val()).find('.col-md-12').html();
            break;
    }

    if (typeId !== '10' && typeId !== '11') $('#quiz_view .slide_view_answer_element > .col-md-12').html(slide_answer_element);
    $('#quiz_view .slide_view_answer_element > .col-md-12').attr('style', '');
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
                answer += $(selectedElement).val() + ';';
            }
            break;

        case '3':
            var selected = $("input[type='radio'][name='answer']:checked");
            if (selected.length > 0) {
                answer = selected.val();
            }
            break;

        case '4':
            answer = $('#short_answer').val();
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

        case '7':
            answer_element = $('tbody#matching_list tr');
            for (let i = 0; i < answer_element.length; i++) {
                answer += $('tbody#matching_list tr').eq(i).find('label').eq(0).html() + ';' + $('tbody#matching_list tr').eq(i).find('label').eq(1).html() + '@';
            }
            break;

        case '8':
            answer_element = $('#fill_blanks')[0].outerHTML;

            let fill_blanks_slide_element = $(answer_element);

            const fill_blanks_dropdown_elements = fill_blanks_slide_element.find('.fill_blanks_dropdown');

            let dropdown_label_element;
            for (let i = 0; i < fill_blanks_dropdown_elements.length; i++) {
                dropdown_label_element = fill_blanks_dropdown_elements.eq(i).find('label');
                for (let j = 0; j < dropdown_label_element.length; j++) {
                    answer += dropdown_label_element.eq(j).html() + ';';
                }
                answer += '@';
            }


            break;

        case '9':
            answer_element = $('#select_lists')[0].outerHTML;

            let select_lists_slide_element = $(answer_element);

            const select_lists_dropdown_elements = select_lists_slide_element.find('.select_lists_dropdown');

            let dropdown_input_element;
            let name;
            for (let i = 0; i < select_lists_dropdown_elements.length; i++) {
                name = select_lists_dropdown_elements.eq(i).find('input').eq(0).attr('name');
                answer += $("input[type='radio'][name='" + name + "']:checked").val() + ';';
            }

            break;

        case '10':
            answer_element = $('#drag_words .blank input');
            for (let i = 0; i < answer_element.length; i++) {
                answer += answer_element.eq(i).val() + ';';
            }
            break;

        case '11':
            var canvas = get_canvas();
            var string;
            if (canvas.item(0) === undefined) {
                string = '{}';
            } else {
                switch (canvas.item(0).get('type')) {
                    case 'circle':
                        string = '{"type": "circle", "radius": ' + (canvas.item(0).oCoords.mb.x - canvas.item(0).oCoords.bl.x) + ', "top": ' + canvas.item(0).top + ', "left": ' + canvas.item(0).left + '}';
                        break;
                    case 'rect':
                        string = '{"type": "rect", "width": ' + (canvas.item(0).oCoords.br.x - canvas.item(0).oCoords.bl.x) + ', "height": ' + (canvas.item(0).oCoords.bl.y - canvas.item(0).oCoords.tl.y) + ', "top": ' + canvas.item(0).top + ', "left": ' + canvas.item(0).left + '}';
                        break;
                    default:
                        string = '{"type": "polyline", "points" : ' + JSON.stringify(canvas.item(0).points) + '}';
                        console.log(string);
                        break;
                }
            }
            var answer_info = $('#answer_content').val();
            answer = answer_info.split('@')[0] + '@' + string;
            break;
    }

    $('#answer_content').val(answer);
}

function slide_to_form() {

    answer_slide2form($('#quiz_view .slide_view_answer_element')[0].outerHTML, $('#answer_content').val());
    $('#question').html(question_slide2form($('#quiz_view .slide_view_question_element')[0].outerHTML));
    $('.slide_view_group_checkbox').remove();
    // $('.slide_view_answer_freeze_element').remove();

}

function form_to_slide() {
    answer_store();
    question_form2slide();
    answer_form2slide();
    fit_slide_view();
    fit_slide_view_quiz_list();
    // media_form2slide();

    $('#quiz_view .slide_view_group').resizable();
    $('#quiz_view #quiz_background_container .slide_view_group').draggable({cancel: 'div.cancel_drag', containment: 'parent'});
    if ($('#quiz_view .slide_view_group_checkbox').length === 0) $('#quiz_view .slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');
    // $('.slide_view_answer_element').prepend('<div class="slide_view_answer_freeze_element" style="width: 100%;height: 100%;position: absolute;z-index: 100;"></div>')

}

/*
* *********** fit size of slide view ********************
* */
$(window).resize(function () {
    fit_slide_view();
    fit_slide_view_quiz_list();
});

function fit_slide_view() {
    const zoom_width = ($('#quiz_view .slide_view_element').width() - 30) / parseInt($('#screen_width').val());
    const zoom_height = ($('#quiz_view .slide_view_element').height() - 30) / parseInt($('#screen_height').val());
    const zoom = Math.min(zoom_width, zoom_height);
    $('#quiz_view #slide_view_container').eq(0).css('zoom', zoom);
}

function fit_slide_view_quiz_list() {
    const zoom = ($('#slide_view_quiz_list').width() - 40) / parseInt($('#screen_width').val());
    $('.preview_item > div').css('zoom', zoom);
}

/**************************************************************/

function store_theme_style(style) {
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

function add_canvas_item_info(string) {
    var answer_info = $('#answer_content').val();
    $('#answer_content').val(answer_info.split('@')[0] + '@' + string);
}

/*
* ************ Remove other slide view elements *****************
* */
$('body').keydown(function (e) {

    if (e.keyCode == 46) {
        if ($('#quiz_view .other_slide_view_element.selected_slide_view_group').length > 0) {
            $('#quiz_view .other_slide_view_element.selected_slide_view_group').remove();
        }
    }
});

/*
* *********** Multiple selection (add class 'selected_slide_view_group')
* */
$("body").click(function (e) {
    const element = $(e.target);
    if (element.closest('#quiz_background_container').length > 0) {
        if (element[0].classList.contains('slide_view_group_checkbox')) {
            if (element.is(':checked')) {
                element.closest('.slide_view_group').addClass('selected_slide_view_group');
            } else {
                element.closest('.slide_view_group').removeClass('selected_slide_view_group');
            }
        } else {
            $('.slide_view_group').removeClass('selected_slide_view_group');
            $('.slide_view_group_checkbox').prop('checked', false);
            element.closest('.slide_view_group').addClass('selected_slide_view_group');
            element.closest('.slide_view_group').find('.slide_view_group_checkbox').prop('checked', true);
        }
    }
});

/*
********************** inserting slide view textbox ***********************
*  */
$('#insert_textbox_btn').click(function () {
    $('.slide_view_group').removeClass('just_added_slide_view_element');
    $('#quiz_background_container').append('<div class="slide_view_group just_added_slide_view_element other_slide_view_element" style="height: 70px;width: 80%;left: 10%;z-index: 3;overflow: hidden;padding:10px;position:absolute;"><div class="cancel_drag" contenteditable="true">Type Text Content</div><input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;"></div>');
    $('.just_added_slide_view_element').draggable({cancel: 'div.cancel_drag'}).resizable();
});

/*
* ************************ inserting slide view picture *******************
 * */
$('#slide_view_picture_import_btn').click(function () {
    $('#slide_view_picture_file_selector').trigger('click');
});

$('#slide_view_picture_file_selector').change(function () {
    var root_url = $('meta[name=url]').attr('content');

    let reader = new FileReader();

    reader.onload = (e) => {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        let formData = new FormData();
        formData.append('image', e.target.result);
        formData.append('quiz_id', $("#quiz_id").val());

        show_preload();
        $.ajax({
            type: 'POST',
            url: root_url + '/hotspots_image_upload',
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    $('.slide_view_group').removeClass('just_added_slide_view_element');
                    $('#quiz_background_container').append(`<div class="slide_view_group just_added_slide_view_element other_slide_view_element" style="left: 10%;z-index: 1;overflow: hidden;padding:10px;position:absolute;"><img src="${root_url}/${response}" style="width: 100%;height: 100%;"><input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;"></div>`);
                    $('.just_added_slide_view_element').draggable({cancel: 'div.cancel_drag'}).resizable();
                }
                hide_preload();
            },
            error: function (response) {
                console.log(response);
                hide_preload();
            }
        });
    }

    reader.readAsDataURL(this.files[0]);

    $('#slide_view_picture_file_selector').val('');
});

/*
* **************** insert video file at slide view ***************
* */
$('#slide_view_video_file_btn').click(function () {
    $('#slide_view_video_file_selector').trigger('click');
});

$('#slide_view_video_file_selector').change(function () {
    var root_url = $('meta[name=url]').attr('content');
    var CSRF_TOKEN = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
    var files = $('#slide_view_video_file_selector')[0].files;

    if (files.length > 0) {
        var fd = new FormData();

        // Append data
        fd.append('file', files[0]);
        fd.append('_token', CSRF_TOKEN);

        // Hide alert
        $('#responseMsg').hide();

        show_preload();
        // AJAX request
        $.ajax({
            url: root_url + '/upload_video',
            method: 'post',
            data: fd,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (response) {


                if (response.success == 1) { // Uploaded successfully

                    $('.slide_view_group').removeClass('just_added_slide_view_element');
                    $('#quiz_background_container').append(`<div class="slide_view_group just_added_slide_view_element other_slide_view_element" style="left: 10%;z-index: 1;overflow: hidden;padding:10px;position:absolute;"><video controls style="width: 100%;"><source src="${response.filepath}" type="video/mp4"></video><input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;"></div>`);
                    $('.just_added_slide_view_element').draggable({cancel: 'div.cancel_drag'}).resizable();
                } else if (response.success == 2) { // File not uploaded

                    // Response message
                    $('#responseMsg').removeClass("alert-success");
                    $('#responseMsg').addClass("alert-danger");
                    $('#responseMsg').html(response.message);
                    $('#responseMsg').show();
                } else {
                    // Display Error
                    $('#err_file').text(response.error);
                    $('#err_file').removeClass('d-none');
                    $('#err_file').addClass('d-block');
                }
                hide_preload();
            },
            error: function (response) {
                console.log("error : " + JSON.stringify(response));
                hide_preload();
            }
        });
    } else {
        alert("Please select a file.");
    }

    $('#slide_view_video_file_selector').val('');
});

/*
* ************** other buttons at ribbon bars *******************
* */
$('#form_view_picture_btn').click(function () {
    $('#form_view_input_media_element').trigger('click');
});

$('#form_view_video_file_btn').click(function () {
    $('#form_view_input_video_element').trigger('click');
});

$('#slide_view_insert_audio_btn').click(function () {
    $('#form_view_input_audio_element').trigger('click');
});

$('#form_view_import_audio_file_btn').click(function () {
    $('#form_view_input_audio_element').trigger('click');
});

