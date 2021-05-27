let prev_id = '';

function show_quiz_editor(node) {
    const root_url = $('meta[name=url]').attr('content');
    const quizId = node.attr('id');

    if (quizId === 'none') return;
    if (quizId === undefined) return;

    show_preload();
    $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
        $('#quiz_view').html(data);
        show_correct_view();
        hide_preload();
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });
}

function onNodeClick(node) {

    if (prev_id === '') {
        show_quiz_editor(node);
        prev_id = node.attr('id');
        return;
    }

    if (prev_id === node.attr('id')) return;
    console.log(is_edited());
    if (is_edited()) {

        if (confirm('You are going to leave this quiz. Some data will be lost. Are you sure you want to continue?')) {
            show_quiz_editor(node);
            prev_id = node.attr('id');
        } else {
            $('#quiz_list').find('.current').removeClass('current current-select');
            $('#quiz_list li#' + prev_id).addClass('current current-select');
        }
    } else {
        show_quiz_editor(node);
        prev_id = node.attr('id');
    }
}

function is_edited() {
    if ($('.slide_view_question_element').length == 0) return false;
    if (is_form_or_slide() === 'form') {
        form_to_slide();
    }

    if (is_form_or_slide() === 'slide') {
        slide_to_form();
    }

    if ($('.slide_view_group_checkbox').length === 0) $('.slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');

    console.log('Updating quiz now...');

    const typeId = $('#type_id').val();
    let question_element = $('.slide_view_question_element')[0].outerHTML;

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
    let answer_element = $('.slide_view_answer_element')[0].outerHTML;
    let media_element = $('.slide_view_media_element')[0] == undefined ? null : $('.slide_view_media_element')[0].outerHTML;
    let video_element = $('.slide_view_video_element')[0] == undefined ? null : $('.slide_view_video_element')[0].outerHTML;
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

    console.log($('.other_slide_view_element').length);

    let other_elements = '';
    for (let i = 0; i < $('.other_slide_view_element').length; i++) {
        other_elements += remove_resizable_tag($('.other_slide_view_element').eq(i)[0].outerHTML);
    }

    const tmp_values = question_element + answer + answer_element + media_element + feedback_correct + feedback_incorrect + feedback_try_again + media + media_element + video + audio + video_element + background_img + question_type + feedback_type + branching + attempts + shuffle_answers + partially_correct + limit_number_response + case_sensitive + correct_score + incorrect_score + try_again_score + other_elements;

    if (tmp_values.replaceAll(/\s/g, '') == $('#tmp_quiz_database_values').val().replaceAll(/\s/g, '')) {
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
        alert('You can\'t insert quizzes at Results Group!');
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

    let order = parentNode.find('li').index(node.next());
    if (node.attr('id') === 'none' || node.attr('id') === undefined) order = 0;
    if (quiz_type == 12 || quiz_type == 13) order = 0;
    console.log(order);
    // return;

    console.log(groupId);
    if (groupId === undefined) {
        alert('Choose a quiz and then insert a new quiz');
        return;
    }

    show_preload();
    $.post(root_url + "/quizes", {
            '_token': token,
            'type_id': quiz_type,
            'exam_group_id': groupId,
            'order': order,
        },
        function (data, status) {
            quizId = data;
            node.next().attr('id', quizId);
            if (node.attr('id') === 'none' || node.attr('id') === undefined) node.remove();

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);
                show_correct_view();
                hide_preload();
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
                hide_preload();
            });
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });
}

function update_quiz() {

    if (is_form_or_slide() === 'form') {
        form_to_slide();
    }

    if (is_form_or_slide() === 'slide') {
        slide_to_form();
    }

    if ($('.slide_view_group_checkbox').length === 0) $('.slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');

    console.log('Updating quiz now...');

    const typeId = $('#type_id').val();
    let question_element = $('.slide_view_question_element')[0].outerHTML;

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
    let answer_element = $('.slide_view_answer_element')[0].outerHTML;
    let media_element = $('.slide_view_media_element')[0] == undefined ? null : $('.slide_view_media_element')[0].outerHTML;
    let video_element = $('.slide_view_video_element')[0] == undefined ? null : $('.slide_view_video_element')[0].outerHTML;
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
    shuffle_answers = shuffle_answers === 'true' ? 1 : 0;
    if ($('#shuffle_answers').length === 0) shuffle_answers = null;

    let partially_correct = $('#partially_correct').is(":checked");
    partially_correct = partially_correct === 'true' ? 1 : 0;
    if ($('#partially_correct').length === 0) partially_correct = null;

    let limit_number_response = $('#limit_number_response').is(":checked");
    limit_number_response = limit_number_response === 'true' ? 1 : 0;
    if ($('#limit_number_response').length === 0) limit_number_response = null;

    let case_sensitive = $('#case_sensitive').is(":checked");
    case_sensitive = case_sensitive === 'true' ? 1 : 0;
    if ($('#case_sensitive').length === 0) case_sensitive = null;

    console.log($('.other_slide_view_element').length);

    let other_elements = '';
    for (let i = 0; i < $('.other_slide_view_element').length; i++) {
        other_elements += remove_resizable_tag($('.other_slide_view_element').eq(i)[0].outerHTML);
    }

    console.log(other_elements);

    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const quizId = $('#quiz_list').find('.current').attr('id');

    show_preload();
    $.ajax({
        url: root_url + '/quizes/' + quizId,
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
            alert('Quiz updated successfully');
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
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

function delete_quiz() {
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const node = $('#quiz_list').find('.current');

    if (node.closest('.node-group').attr('data-caption') == 'Results') {
        alert('You can\'t this slide!');
        return;
    }

    const quizId = node.attr('id');
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

            console.log(parentNode.find('li').length);
            if (parentNode.find('li').length === 1) {
                Metro.getPlugin('#quiz_list', 'listview').add(parentNode, {
                    caption: 'No questions',
                    content: '<i>Add questions<i>'
                });
            }

            node.remove();
            $('#quiz_view').html('');
            alert('Quiz Group deleted successfully');
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });

}

function is_form_or_slide() {
    if ($('#form_view_btn').hasClass('clicked')) return 'form';
    if ($('#slide_view_btn').hasClass('clicked')) return 'slide';
}

function show_correct_view() {
    console.log(is_form_or_slide());
    if (is_form_or_slide() === 'form') {
        $('.form_view_element').show();
        $('.slide_view_element').hide();
    }

    if (is_form_or_slide() === 'slide') {
        $('.form_view_element').hide();
        $('.slide_view_element').show();

        $('.slide_view_group').resizable();
        $('.slide_view_group').draggable({cancel: 'div.cancel_drag'});
        if ($('.slide_view_group_checkbox').length === 0) $('.slide_view_group').append('<input class="slide_view_group_checkbox" type="checkbox" style="position: absolute;top: 0;left: 0;">');
    }
}

/*
*  For Preview
* */
var root_url = $('meta[name=url]').attr('content');

$('.preview_quiz_btn').click(function () {
    window.open(root_url + '/preview_exam/' + $('#exam_id').val());
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
    const node = lv.addGroup({
        caption: 'Question Group',
    });
    Metro.getPlugin('#quiz_list', 'listview').add(node, {
        caption: 'No questions',
        content: '<i>Add questions<i>'
    });

    console.log($('#quiz_list li:nth-last-child(2)'));
    const element = $('#quiz_list li:nth-last-child(2)')[0].outerHTML;
    $('#quiz_list li:nth-last-child(2)').remove();
    $('#quiz_list').append(element);

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

            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });
});

/*
* ***************** Delete question group *****************
* */
function delete_question_group() {
    if ($('.current-group').length == 0) {
        alert('Please choose question group to remove.');
    }

    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const node = $('#quiz_list').find('.current-group');
    const groupId = node.attr('id');

    show_preload();
    $.ajax({
        url: root_url + '/exam_groups/' + groupId,
        type: 'DELETE',
        data: {
            id: groupId,
            _token: token,

        },
        success: function (data) {

            node.remove();
            $('#quiz_view').html('');
            alert('Quiz deleted successfully');
            hide_preload();
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });
}

/*
* **************** Duplicate quiz ***************
* */

$('#duplicate_btn').click(function () {
    const lv = Metro.getPlugin('#quiz_list', 'listview');

    if ($('.current').length == 0) {
        alert("Choose a quiz to duplicate.")
        return;
    }

    const parentNode = $('.current').closest('.node-group');
    const groupId = parentNode.attr('id');
    const node = parentNode.find('li.current');

    if (parentNode.attr('data-caption') == 'Results') {
        alert('You can\'t duplicate at Results Group!');
        return;
    }

    if (node.attr('data-content') == '<i>Info Slide</i>' || node.attr('data-content') == '<i>Quiz Instructions</i>') {
        alert("This slide can't be duplicated!")
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
                show_correct_view();
                hide_preload();
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
                hide_preload();
            });
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
        hide_preload();
    });
});
