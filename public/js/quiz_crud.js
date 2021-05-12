function onNodeClick(node) {
    const root_url = $('meta[name=url]').attr('content');
    const quizId = node.attr('id');

    if (quizId === 'none') return;

    $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
        $('#quiz_view').html(data);
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
                caption: 'Select the correct answer option:',
                content: '<i>Multiple Choice<i>'
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
            console.log(data);
            quizId = data;
            node.next().attr('id', quizId);
            if (node.attr('id') === 'none' || node.attr('id') === undefined) node.remove();

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);
            });
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });

}

function update_quiz() {
    console.log('Updating quiz now...');

    const question_element = $('.slide_view_question_element')[0].outerHTML;

    let answer = "";
    var selected = $("input[type='radio'][name='answer']:checked");
    if (selected.length > 0) {
        answer = selected.val();
    }

    const feedback_correct = $('.feedback_branching tr:first-child td:nth-child(2) label').html();
    const feedback_incorrect = $('.feedback_branching tr:nth-child(2) td:nth-child(2) label').html();
    const feedback_try_again = $('.feedback_branching tr:nth-child(3) td:nth-child(2) label').html();
    const correct_score = $('.feedback_branching tr:first-child td:nth-child(4) label').html();
    const incorrect_score = $('.feedback_branching tr:nth-child(2) td:nth-child(4) label').html();
    const try_again_score = $('.feedback_branching tr:nth-child(3) td:nth-child(4) label').html();
    // const media
    // const order
    const answer_element = $('.slide_view_answer_element')[0].outerHTML;
    const question_type = Metro.getPlugin('#question_type', 'select').val();
    const feedback_type = Metro.getPlugin('#feedback', 'select').val();

    let branching = Metro.getPlugin('#branching', 'select').val();
    if ($('#branching:disabled').length !== 0) branching = null;

    const score = Metro.getPlugin('#score', 'select').val();
    const attempts = Metro.getPlugin('#attempts', 'select').val();

    let is_limit_time = $('#is_limit_time').is(":checked");
    if ($('#is_limit_time').length === 0) is_limit_time = null;

    const limit_time = $('#limit_time').val();

    let shuffle_answers = $('#shuffle_answers').is(":checked");
    if ($('#shuffle_answers').length === 0) shuffle_answers = null;

    let partially_correct = $('#partially_correct').is(":checked");
    if ($('#partially_correct').length === 0) partially_correct = null;

    let limit_number_response = $('#limit_number_response').is(":checked");
    if ($('#limit_number_response').length === 0) limit_number_response = null;

    let case_sensitive = $('#case_sensitive').is(":checked");
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
            feedback_correct: feedback_correct,
            feedback_incorrect: feedback_incorrect,
            feedback_try_again: feedback_try_again,
            // media: media,
            // order: order,
            question_type: question_type,
            feedback_type: feedback_type,
            branching: branching,
            score: score,
            attempts: attempts,
            is_limit_time: is_limit_time === 'true' ? 1 : 0,
            limit_time: limit_time,
            shuffle_answers: shuffle_answers === 'true' ? 1 : 0,
            partially_correct: partially_correct === 'true' ? 1 : 0,
            limit_number_response: limit_number_response === 'true' ? 1 : 0,
            case_sensitive: case_sensitive === 'true' ? 1 : 0,
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
