function onNodeClick(node) {
    const root_url = $('meta[name=url]').attr('content');
    const quizId = node.attr('id');

    if (quizId === 'none') return;

    $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
        $('#quiz_view').html(data);
        show_correct_view();
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });

}

function create_quiz(quiz_type, root_url, token) {

    let quizId;
    const lv = Metro.getPlugin('#quiz_list', 'listview');
    const parentNode = $('.current').closest('.node-group');
    const groupId = parentNode.attr('id');
    const node = parentNode.find('li:last');


    switch (quiz_type) {
        case (1):
            lv.insertAfter(node, {
                caption: 'Select the correct answer option:',
                content: '<i>Multiple Choice<i>'
            });
            break;


        case (2):
            lv.insertAfter(node, {
                caption: 'Select one or more correct answers:',
                content: '<i>Multiple Response<i>'
            });
            break;

        case (3):
            lv.insertAfter(node, {
                caption: 'Choose whether the statement...',
                content: '<i>True/False<i>'
            });
            break;

        case (4):
            lv.insertAfter(node, {
                caption: 'Type your response:',
                content: '<i>Short Answer<i>'
            });
            break;

        case (5):
            lv.insertAfter(node, {
                caption: 'Type your response:',
                content: '<i>Numeric<i>'
            });
            break;

        case (6):
            lv.insertAfter(node, {
                caption: 'Arrange the following items in the...',
                content: '<i>Sequence<i>'
            });
            break;

        case (7):
            lv.insertAfter(node, {
                caption: 'Match the following items with th...',
                content: '<i>Matching<i>'
            });
            break;

        case (8):
            lv.insertAfter(node, {
                caption: 'Fill in the blank fields in this text:',
                content: '<i>Fill in the Blanks<i>'
            });
            break;

        case (9):
            lv.insertAfter(node, {
                caption: 'Choose the correct answer in ...',
                content: '<i>Select from Lists<i>'
            });
            break;

        case (10):
            lv.insertAfter(node, {
                caption: 'Drag and drop the words to their ...',
                content: '<i>Drag the Words<i>'
            });
            break;

        case (11):
            lv.insertAfter(node, {
                caption: 'Click on the correct area in th...',
                content: '<i>Hotspot<i>'
            });
            break;

        default:
    }

    $('#quiz_list').find('.current').removeClass('current current-select');
    node.next().addClass('current current-select');

    $.post(root_url + "/quizes", {
            '_token': token,
            'type_id': quiz_type,
            'exam_group_id': groupId,
        },
        function (data, status) {
            quizId = data;
            node.next().attr('id', quizId);
            if (node.attr('id') === 'none' || node.attr('id') === undefined) node.remove();

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);
                show_correct_view();
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
            });
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });

}

function update_quiz() {

    if (is_form_or_slide() === 'form') {
        form_to_slide();
    }

    if (is_form_or_slide() === 'slide') {
        slide_to_form();
    }

    console.log('Updating quiz now...');

    const typeId = $('#type_id').val();
    const question_element = $('.slide_view_question_element')[0].outerHTML;

    const answer = $('#answer_content').val();

    const feedback_correct = $('.feedback_branching tr:first-child td:nth-child(2) label').html();
    const feedback_incorrect = $('.feedback_branching tr:nth-child(2) td:nth-child(2) label').html();
    const feedback_try_again = $('.feedback_branching tr:nth-child(3) td:nth-child(2) label').html();
    const correct_score = $('.feedback_branching tr:first-child td:nth-child(4) label').html();
    const incorrect_score = $('.feedback_branching tr:nth-child(2) td:nth-child(4) label').html();
    const try_again_score = $('.feedback_branching tr:nth-child(3) td:nth-child(4) label').html();
    const media = $('#media').val();
    const background_img = $('#background_img').val();
    // const order
    const answer_element = $('.slide_view_answer_element')[0].outerHTML;
    const media_element = $('.slide_view_media_element')[0].outerHTML;
    const question_type = Metro.getPlugin('#question_type', 'select').val();
    const feedback_type = Metro.getPlugin('#feedback', 'select').val();

    let branching;
    if ($('#branching:disabled').length !== 0 || $('#branching').length === 0) {
        branching = null;
    } else {
        branching = Metro.getPlugin('#branching', 'select').val();
    }

    const score = Metro.getPlugin('#score', 'select').val();
    const attempts = Metro.getPlugin('#attempts', 'select').val();

    let is_limit_time = $('#is_limit_time').is(":checked");
    is_limit_time = is_limit_time === 'true' ? 1 : 0;
    if ($('#is_limit_time').length === 0) is_limit_time = null;

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

    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const quizId = $('#quiz_list').find('.current').attr('id');

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
            background_img: background_img,
            // order: order,
            question_type: question_type,
            feedback_type: feedback_type,
            branching: branching,
            score: score,
            attempts: attempts,
            is_limit_time: is_limit_time,
            limit_time: limit_time,
            shuffle_answers: shuffle_answers,
            partially_correct: partially_correct,
            limit_number_response: limit_number_response,
            case_sensitive: case_sensitive,
            correct_score: correct_score,
            incorrect_score: incorrect_score,
            try_again_score: try_again_score,
        },
        success: function (data) {
            alert('Quiz updated successfully');
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });

}

function delete_quiz() {
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');
    const node = $('#quiz_list').find('.current');
    const quizId = node.attr('id');

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
            alert('Quiz deleted successfully');
        }
    }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
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
