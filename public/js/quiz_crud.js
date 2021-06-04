let prev_id = '';
let clicked_node;

function show_quiz_editor(node) {
    const root_url = $('meta[name=url]').attr('content');
    const quizId = node.attr('id');

    if (quizId === 'none') return;
    if (quizId === undefined) return;

    show_preload();
    $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
        $('.selected_preview_item').removeClass('selected_preview_item');
        $('#preview_item-' + quizId).addClass('selected_preview_item');

        $('#quiz_view').html(data);
        show_correct_view();
        store_quiz_state();
        hide_preload();
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });
}

$('#alert_save').click(function () {
    console.log('alert_save');
    update_quiz(true);

    $('#question_save_alert').fadeOut(300);
});

$('#alert_not_save').click(function () {
    console.log('alert_not_save');
    show_quiz_editor(clicked_node);
    prev_id = clicked_node.attr('id');

    $('#question_save_alert').fadeOut(300);
});

$('#alert_cancel').click(function () {
    console.log('alert_cancel');
    $('#quiz_list').find('.current').removeClass('current current-select');
    $('#quiz_list li#' + prev_id).addClass('current current-select');

    console.log(prev_id);
    // $('.selected_preview_item').removeClass('selected_preview_item');
    // $('#preview_item-' + prev_id).addClass('selected_preview_item');

    $('#question_save_alert').fadeOut(300);
});

function onNodeClick(node) {

    clicked_node = node;

    if (prev_id === '') {
        show_quiz_editor(node);
        prev_id = node.attr('id');
        return;
    }

    if (prev_id === node.attr('id')) return;
    if (is_edited()) {

        $('#question_save_alert').fadeIn(300);

    } else {
        show_quiz_editor(node);
        prev_id = node.attr('id');
    }
}

function is_edited() {
    if ($('#quiz_view .slide_view_question_element').length == 0) return false;

    if (remove_zoom_style(get_quiz_state().replaceAll(/\s/g, '')) == remove_zoom_style($('#tmp_quiz_database_values').val().replaceAll(/\s/g, '').replaceAll('null', ''))) {
        return false;
    } else {
        return true;
    }
}

function create_quiz(quiz_type, root_url, token) {

    let quizId;
    const lv = Metro.getPlugin('#quiz_list', 'listview');
    const parentNode = $('.current').closest('.node-group');
    const groupId = parentNode.attr('id');
    const node = parentNode.find('li.current');
    // const node = parentNode.find('li:last');
    const firstParentNode = $('.node-group:first');
    const firstNode = firstParentNode.find('li:first');

    if (parentNode.attr('data-caption') == 'Results') {
        show_modal('error', 'Warning', 'You can\'t insert quizzes at Results Group!');
        return;
    }

    switch (quiz_type) {
        case (1):
            lv.insertAfter(node, {
                caption: 'Select the correct answer option:',
                content: '<i>Multiple Choice</i>'
            });
            break;


        case (2):
            lv.insertAfter(node, {
                caption: 'Select one or more correct answers:',
                content: '<i>Multiple Response</i>'
            });
            break;

        case (3):
            lv.insertAfter(node, {
                caption: 'Choose whether the statement is true or false:',
                content: '<i>True/False</i>'
            });
            break;

        case (4):
            lv.insertAfter(node, {
                caption: 'Type your response:',
                content: '<i>Short Answer</i>'
            });
            break;

        case (5):
            lv.insertAfter(node, {
                caption: 'Type your response:',
                content: '<i>Numeric</i>'
            });
            break;

        case (6):
            lv.insertAfter(node, {
                caption: 'Arrange the following items in the correct order:',
                content: '<i>Sequence</i>'
            });
            break;

        case (7):
            lv.insertAfter(node, {
                caption: 'Match the following items with their descriptions:',
                content: '<i>Matching</i>'
            });
            break;

        case (8):
            lv.insertAfter(node, {
                caption: 'Fill in the blank fields in this text:',
                content: '<i>Fill in the Blanks</i>'
            });
            break;

        case (9):
            lv.insertAfter(node, {
                caption: 'Choose the correct answer in each drop-down list:',
                content: '<i>Select from Lists</i>'
            });
            break;

        case (10):
            lv.insertAfter(node, {
                caption: 'Drag and drop the words to their places:',
                content: '<i>Drag the Words</i>'
            });
            break;

        case (11):
            lv.insertAfter(node, {
                caption: 'Click on the correct area in the image.',
                content: '<i>Hotspot</i>'
            });
            break;

        case (12):
            lv.insertBefore(firstNode, {
                caption: 'Title',
                content: '<i>Info Slide</i>'
            });
            break;

        case (13):
            lv.insertBefore(firstNode, {
                caption: 'Quiz Instructions',
                content: '<i>Quiz Instructions</i>'
            });
            break;

        default:
    }

    $('#quiz_list').find('.current').removeClass('current current-select');
    if (quiz_type == 12 || quiz_type == 13) {
        parentNode.find('li').eq(0).addClass('current current-select');
    } else {
        node.next().addClass('current current-select');
    }

    let order = parseInt(node.attr('order')) + 1;
    if (node.attr('id') === 'none' || node.attr('id') === undefined) order = 0;
    if (quiz_type == 12 || quiz_type == 13) order = 0;
    // return;

    if (groupId === undefined) {
        show_modal('error', 'Warning', 'Choose a quiz and then insert a new quiz');
        return;
    }

    const exam_id = $('#exam_id').val();

    show_preload();
    $.post(root_url + "/quizes", {
            '_token': token,
            'type_id': quiz_type,
            'exam_group_id': groupId,
            'exam_id': exam_id,
            'order': order,
        },
        function (data, status) {
            quizId = data;

            for (let i = 0; i < $('#quiz_list li.node').length; i++) {
                if (parseInt($('#quiz_list li.node').eq(i).attr('order')) >= order) {
                    $('#quiz_list li.node').eq(i).attr('order', parseInt($('#quiz_list li.node').eq(i).attr('order')) + 1);
                }
            }

            if (quiz_type == '12' || quiz_type == '13') {
                parentNode.find('li').eq(0).attr('id', quizId);
                parentNode.find('li').eq(0).attr('order', order);
            } else {
                node.next().attr('id', quizId);
                node.next().attr('order', order);
            }


            if (node.attr('id') === 'none' || node.attr('id') === undefined) node.remove();

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);

                const element = '<div id="preview_item-' + quizId + '" class="preview_item selected_preview_item">' + $('#quiz_view .slide_view_element').html().replace('top:50%;left:50%;transform:translate(-50%, -50%);', '') + '</div>';

                console.log(prev_id);

                if (prev_id == undefined || prev_id == 'none' || prev_id == '') {
                    if ($('#slide_view_quiz_list .preview_item').length == 2) {
                        $('#slide_view_quiz_list').prepend(element);
                    } else {
                        const tmp_id = $('.node.current').closest('.node-group').prev().find('.listview').eq(0).find('li.node').last().eq(0).attr('id');
                        $(element).insertAfter($('#preview_item-' + tmp_id));
                    }
                } else {
                    $(element).insertAfter($('#preview_item-' + prev_id));
                }

                $('#preview_item-' + quizId + ' > div').css({
                    'margin': 'auto',
                    'zoom': $('#preview_item-' + prev_id + ' > div').css('zoom'),
                });

                $('.selected_preview_item').removeClass('selected_preview_item');
                $('#preview_item-' + quizId).addClass('selected_preview_item');

                show_correct_view();
                store_quiz_state();
                hide_preload();

                prev_id = quizId;
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
                if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
                    window.location.href = '/';
                }
                hide_preload();
            });
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });
}

function update_quiz(is_alert_save) {

    if (is_form_or_slide() === 'form') {
        form_to_slide();
    }

    if (is_form_or_slide() === 'slide') {
        slide_to_form();
    }

    if ($('#quiz_view .slide_view_group_checkbox').length === 0) $('#quiz_view .slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');


    const typeId = $('#type_id').val();
    let question_element = $('#quiz_view .slide_view_question_element')[0].outerHTML;

    const answer = $('#answer_content').val();

    const feedback_correct = $('.feedback_branching tr:first-child td:nth-child(2) label').html();
    const feedback_incorrect = $('.feedback_branching tr:nth-child(2) td:nth-child(2) label').html();
    const feedback_try_again = $('.feedback_branching tr:nth-child(3) td:nth-child(2) label').html();
    const correct_score = $('.feedback_branching tr:first-child td:nth-child(3) label').html();
    const incorrect_score = $('.feedback_branching tr:nth-child(2) td:nth-child(3) label').html();
    const try_again_score = $('.feedback_branching tr:nth-child(3) td:nth-child(3) label').html();
    const media = $('#media').val();
    const video = $('#video').val();
    const audio = $('#audio').val();
    const background_img = $('#background_img').val();
    // const order
    let answer_element = $('#quiz_view .slide_view_answer_element')[0].outerHTML;
    let media_element = $('#quiz_view .slide_view_media_element')[0] == undefined ? null : $('#quiz_view .slide_view_media_element')[0].outerHTML;
    let video_element = $('#quiz_view .slide_view_video_element')[0] == undefined ? null : $('#quiz_view .slide_view_video_element')[0].outerHTML;
    const question_type = Metro.getPlugin('#question_type', 'select').val();
    const feedback_type = Metro.getPlugin('#feedback', 'select').val();

    question_element = remove_resizable_tag(question_element);
    answer_element = remove_resizable_tag(answer_element);
    media_element = remove_resizable_tag(media_element);
    video_element = remove_resizable_tag(video_element);

    let branching;
    if ($('#branching:disabled').length !== 0 || $('#branching').length === 0) {
        branching = null;
    } else {
        branching = Metro.getPlugin('#branching', 'select').val();
    }

    // const score = Metro.getPlugin('#score', 'select').val();
    const attempts = Metro.getPlugin('#attempts', 'select').val();

    // let is_limit_time = $('#is_limit_time').is(":checked");
    // is_limit_time = is_limit_time === 'true' ? 1 : 0;
    // if ($('#is_limit_time').length === 0) is_limit_time = null;

    const limit_time = $('#limit_time').val();

    let shuffle_answers = $('#shuffle_answers').is(":checked");
    shuffle_answers = shuffle_answers ? 1 : 0;
    if ($('#shuffle_answers').length === 0) shuffle_answers = null;

    let partially_correct = $('#partially_correct').is(":checked");
    partially_correct = partially_correct ? 1 : 0;
    if ($('#partially_correct').length === 0) partially_correct = null;

    let limit_number_response = $('#limit_number_response').is(":checked");
    limit_number_response = limit_number_response ? 1 : 0;
    if ($('#limit_number_response').length === 0) limit_number_response = null;

    let case_sensitive = $('#case_sensitive').is(":checked");
    case_sensitive = case_sensitive ? 1 : 0;
    if ($('#case_sensitive').length === 0) case_sensitive = null;


    let other_elements = '';
    for (let i = 0; i < $('#quiz_view .other_slide_view_element').length; i++) {
        other_elements += remove_resizable_tag($('#quiz_view .other_slide_view_element').eq(i)[0].outerHTML);
    }


    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const quizId = $('#quiz_list').find('.current').attr('id');

    console.log(root_url + '/quizes/' + (is_alert_save ? prev_id : quizId));

    show_preload();
    $.ajax({
        url: root_url + '/quizes/' + (is_alert_save ? prev_id : quizId),
        type: 'PUT',
        data: {
            _token: token,
            question_element: question_element,
            answer: answer,
            answer_element: answer_element,
            media_element: media_element,
            feedback_correct: feedback_correct,
            feedback_incorrect: feedback_incorrect,
            feedback_try_again: feedback_try_again,
            media: media,
            media_element: media_element,
            video: video,
            audio: audio,
            video_element: video_element,
            background_img: background_img,
            // order: order,
            question_type: question_type,
            feedback_type: feedback_type,
            branching: branching,
            // score: score,
            attempts: attempts,
            // is_limit_time: is_limit_time,
            // limit_time: limit_time,
            shuffle_answers: shuffle_answers,
            partially_correct: partially_correct,
            limit_number_response: limit_number_response,
            case_sensitive: case_sensitive,
            correct_score: correct_score,
            incorrect_score: incorrect_score,
            try_again_score: try_again_score,
            other_elements: other_elements,
        },
        success: function (data) {
            show_modal('success', 'Success', 'Question updated successfully');
            store_quiz_state();
            if (is_alert_save) {
                show_quiz_editor(clicked_node);
                prev_id = clicked_node.attr('id');
            }
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });

}

function remove_resizable_tag(string) {
    var tmp_element;
    if (string != null) {
        tmp_element = $(string);
        tmp_element.removeClass('selected_slide_view_group');
        tmp_element.children('.ui-resizable-handle').remove();
        tmp_element.children('input[type=checkbox]').remove();
        return tmp_element[0].outerHTML;
    }
    return null;
}

function show_delete_dialog(string, element) {
    if (string == 'question') {

        const node = $('#quiz_list').find('.current');

        if (node.closest('.node-group').attr('data-caption') == 'Results') {
            show_modal('error', 'Warning', 'You can\'t this slide!');
            return;
        }

        const quizId = string + '-' + node.attr('id');
        $('#delete_dialog_id').val(quizId);
    }

    if (string == 'group') {
        const groupId = string + '-' + $(element).attr('id').split('-')[1];
        $('#delete_dialog_id').val(groupId);
    }

    $('#delete_confirm_dialog').fadeIn(500);
};

$('#delete_no').click(function () {
    $('#delete_confirm_dialog').fadeOut(500);
});

$('#delete_yes').click(function () {
    $('#delete_confirm_dialog').fadeOut(500);

    const dialog_id = $('#delete_dialog_id').val();

    if (dialog_id.split('-')[0] == 'question') {
        delete_quiz(dialog_id.split('-')[1]);
    }

    if (dialog_id.split('-')[0] == 'group') {
        delete_question_group(dialog_id.split('-')[1]);
    }
});

function get_next_node_element(node) {
    var nodeCollection = $('.node');
    var index = nodeCollection.index(node);

    return nodeCollection.eq(index + 1);
}

function delete_quiz(quizId) {
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');

    const node = $('#quiz_list').find('.current');

    prev_id = '';

    show_preload();
    $.ajax({
        url: root_url + '/quizes/' + quizId,
        type: 'DELETE',
        data: {
            id: quizId,
            _token: token,

        },
        success: function (data) {

            const parentNode = $('.current').closest('.node-group');

            if (parentNode.find('li').length === 1) {
                Metro.getPlugin('#quiz_list', 'listview').add(parentNode, {
                    caption: 'No questions',
                    content: '<i>Add questions<i>'
                });
            }

            console.log(get_next_node_element(node));
            get_next_node_element(node).trigger('click');

            node.remove();
            $('#preview_item-' + quizId).remove();

            $('#quiz_view').html('');
            show_modal('success', 'Success', 'Question deleted successfully');
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });

}

function is_form_or_slide() {
    if ($('#form_view_btn').hasClass('clicked')) return 'form';
    if ($('#slide_view_btn').hasClass('clicked')) return 'slide';
}

function show_correct_view() {
    if (is_form_or_slide() === 'form') {
        $('.form_view_element').show();
        $('.slide_view_element').hide();
    }

    if (is_form_or_slide() === 'slide') {
        $('.form_view_element').hide();
        $('.slide_view_element').show();
        fit_slide_view();

        $('.slide_view_group').resizable();
        $('.slide_view_group').draggable({cancel: 'div.cancel_drag', containment: 'parent'});
        if ($('.slide_view_group_checkbox').length === 0) $('.slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');
    }
}

/*
*  For Preview
* */
var root_url = $('meta[name=url]').attr('content');

$('.preview_quiz_btn').click(function () {
    window.open(root_url + '/preview_exam/' + $('#exam_id').val() + '&');
});

$('.preview_slide_btn').click(function () {
    window.open(root_url + '/preview_slide/' + $('#quiz_id').val());
});

$('.preview_group_btn').click(function () {
    window.open(root_url + '/preview_group/' + $('#exam_group_id').val());
});

/*
* ************ create question group **************
* */
$('#question_group_btn').click(function () {
    const lv = Metro.getPlugin('#quiz_list', 'listview');
    let node = lv.addGroup({
        caption: 'Question Group',
    });
    node.remove();
    node.insertBefore($('#quiz_list li.node-group:last-child'));

    Metro.getPlugin('#quiz_list', 'listview').add(node, {
        caption: 'No questions',
        content: '<i>Add questions<i>'
    });

    // const element = $('#quiz_list li:nth-last-child(2)')[0].outerHTML;
    // $('#quiz_list li:nth-last-child(2)').remove();
    // $('#quiz_list').append(element);

    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');

    const exam_id = $('#exam_id').val();

    show_preload();
    $.ajax({
        url: root_url + '/add_exam_group',
        type: 'POST',
        data: {
            _token: token,
            exam_id: exam_id,
        },
        success: function (data) {
            node.attr('id', data);
            node.children('div.data').append('<i class="fas fa-trash" id="delete_group_icon-' + data + '" style="font-size: 12px;" onclick="show_delete_dialog(\'group\', this)"></i>');
            node.children('div.data').css({
                'display': 'flex',
                'align-items': 'center',
                'justify-content': 'space-around',
            });
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });
});

/*
* ***************** Delete question group *****************
* */
function delete_question_group(groupId) {

    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const node = $('#' + groupId);

    show_preload();
    $.ajax({
        url: root_url + '/exam_groups/' + groupId,
        type: 'DELETE',
        data: {
            id: groupId,
            _token: token,

        },
        success: function (data) {

            for (let i = 0; i < data.length; i++) {
                $('#preview_item-' + data[i]).remove();
            }

            node.remove();
            $('#quiz_view').html('');
            show_modal('success', 'Success', 'Question Group deleted successfully');
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });
}

/*
* **************** Duplicate quiz ***************
* */

$('#duplicate_btn').click(function () {
    const lv = Metro.getPlugin('#quiz_list', 'listview');

    if ($('.current').length == 0) {
        show_modal('error', 'Warning', 'Choose a quiz to duplicate');
        return;
    }

    const parentNode = $('.current').closest('.node-group');
    const groupId = parentNode.attr('id');
    const node = parentNode.find('li.current');

    if (parentNode.attr('data-caption') == 'Results') {
        show_modal('error', 'Warning', 'You can\'t duplicate at Results Group!');
        return;
    }

    if (node.attr('data-content') == '<i>Info Slide</i>' || node.attr('data-content') == '<i>Quiz Instructions</i>') {
        show_modal('error', 'Warning', 'This slide can\'t be duplicated!');
        return;
    }

    lv.insertAfter(node, {
        caption: node.attr('data-caption'),
        content: node.attr('data-content')
    });

    $('#quiz_list').find('.current').removeClass('current current-select');
    node.next().addClass('current current-select');

    let order = parentNode.find('li').index(node.next());
    const id = node.attr('id');
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');

    show_preload();
    $.ajax({
        url: root_url + '/duplicate_quiz',
        type: 'POST',
        data: {
            _token: token,
            id: id,
            order: order,
        },
        success: function (data) {
            quizId = data;
            node.next().attr('id', quizId);

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);

                const element = '<div id="preview_item-' + quizId + '" class="preview_item selected_preview_item">' + $('#quiz_view .slide_view_element').html().replace('top:50%;left:50%;transform:translate(-50%, -50%);', '') + '</div>';
                $(element).insertAfter($('#preview_item-' + prev_id));

                $('#preview_item-' + quizId + ' > div').css({
                    'margin': 'auto',
                    'zoom': $('#preview_item-' + prev_id + ' > div').css('zoom'),
                });

                $('.selected_preview_item').removeClass('selected_preview_item');
                $('#preview_item-' + quizId).addClass('selected_preview_item');

                show_correct_view();
                hide_preload();
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
                if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
                    window.location.href = '/';
                }
                hide_preload();
            });
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        if (XHttpResponse.responseJSON.message == '' && XHttpResponse.status == 404) {
            window.location.href = '/';
        }
        hide_preload();
    });
});

/*
* ************* get quiz state ***************
* */
function get_quiz_state() {
    // if (is_form_or_slide() === 'form') {
    //     form_to_slide();
    // }
    //
    // if (is_form_or_slide() === 'slide') {
    //     slide_to_form();
    // }

    if ($('#quiz_view .slide_view_group_checkbox').length === 0) $('.slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');


    const typeId = $('#type_id').val();
    let question_element = $('#quiz_view .slide_view_question_element')[0].outerHTML;

    const answer = $('#answer_content').val();

    const question = $('#question').html();

    const feedback_correct = $('.feedback_branching tr:first-child td:nth-child(2) label').html();
    const feedback_incorrect = $('.feedback_branching tr:nth-child(2) td:nth-child(2) label').html();
    const feedback_try_again = $('.feedback_branching tr:nth-child(3) td:nth-child(2) label').html();
    const correct_score = $('.feedback_branching tr:first-child td:nth-child(3) label').html();
    const incorrect_score = $('.feedback_branching tr:nth-child(2) td:nth-child(3) label').html();
    const try_again_score = $('.feedback_branching tr:nth-child(3) td:nth-child(3) label').html();
    const media = $('#media').val();
    const video = $('#video').val();
    const audio = $('#audio').val();
    const background_img = $('#background_img').val();
    // const order
    let answer_element = $('#quiz_view .slide_view_answer_element')[0].outerHTML;
    let media_element = $('#quiz_view .slide_view_media_element')[0] == undefined ? null : $('#quiz_view .slide_view_media_element')[0].outerHTML;
    let video_element = $('#quiz_view .slide_view_video_element')[0] == undefined ? null : $('#quiz_view .slide_view_video_element')[0].outerHTML;
    const question_type = Metro.getPlugin('#question_type', 'select').val();
    const feedback_type = Metro.getPlugin('#feedback', 'select').val();

    question_element = remove_resizable_tag(question_element);
    answer_element = remove_resizable_tag(answer_element);
    media_element = remove_resizable_tag(media_element);
    video_element = remove_resizable_tag(video_element);

    let branching;
    if ($('#branching:disabled').length !== 0 || $('#branching').length === 0) {
        branching = '';
    } else {
        branching = Metro.getPlugin('#branching', 'select').val();
    }

    // const score = Metro.getPlugin('#score', 'select').val();
    const attempts = Metro.getPlugin('#attempts', 'select').val();

    // let is_limit_time = $('#is_limit_time').is(":checked");
    // is_limit_time = is_limit_time === 'true' ? 1 : 0;
    // if ($('#is_limit_time').length === 0) is_limit_time = ';

    const limit_time = $('#limit_time').val();

    let shuffle_answers = $('#shuffle_answers').is(":checked");
    shuffle_answers = shuffle_answers === 'true' ? 1 : 0;
    if ($('#shuffle_answers').length === 0) shuffle_answers = '';

    let partially_correct = $('#partially_correct').is(":checked");
    partially_correct = partially_correct === 'true' ? 1 : 0;
    if ($('#partially_correct').length === 0) partially_correct = '';

    let limit_number_response = $('#limit_number_response').is(":checked");
    limit_number_response = limit_number_response === 'true' ? 1 : 0;
    if ($('#limit_number_response').length === 0) limit_number_response = '';

    let case_sensitive = $('#case_sensitive').is(":checked");
    case_sensitive = case_sensitive === 'true' ? 1 : 0;
    if ($('#case_sensitive').length === 0) case_sensitive = '';


    let other_elements = '';
    for (let i = 0; i < $('#quiz_view .other_slide_view_element').length; i++) {
        other_elements += remove_resizable_tag($('#quiz_view .other_slide_view_element').eq(i)[0].outerHTML);
    }

    const tmp_values = question + question_element + answer + answer_element + media_element + feedback_correct + feedback_incorrect + feedback_try_again + media + media_element + video + audio + video_element + background_img + question_type + feedback_type + branching + attempts + shuffle_answers + partially_correct + limit_number_response + case_sensitive + correct_score + incorrect_score + try_again_score + other_elements;

    return tmp_values;
}

/*
* ************ Store quiz state ***************
* */
function store_quiz_state() {
    setTimeout(function () {
        $('#tmp_quiz_database_values').val(get_quiz_state());
    }, 100);
}

/*
* *********** remove zoom style ***************
* */
function remove_zoom_style(string) {
    if (string.indexOf('zoom:') == -1) return string;

    var tmp_1 = string.split('zoom:');
    var tmp_2 = tmp_1[1].split(';');
    tmp_2.shift();
    return (tmp_1[0] + tmp_2.join(';'));
}

/*
* *************** slide view quiz list *************************
* */
$('#slide_view_quiz_list').on('click', '.preview_item', function () {
    $('#' + $(this).attr('id').split('-')[1]).trigger('click');
});

