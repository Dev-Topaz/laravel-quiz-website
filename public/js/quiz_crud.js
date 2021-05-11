function onNodeClick(node) {
    const root_url = $('meta[name=url]').attr('content');
    const quizId = node.attr('id');
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

            $.get(root_url + "/quizes/" + quizId + "/edit", function (data, status) {
                $('#quiz_view').html(data);
            });
        }).catch((XHttpResponse) => {
        console.log(XHttpResponse);
    });

    if (node.attr('id') == 'none') node.remove();


}
