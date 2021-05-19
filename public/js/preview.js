let total_score = 0;
let correct_quiz_count = 0;

function preview() {
    let attempts = 1;
    switch ($('.preview_btn button').html()) {
        case 'Submit':
            if (evulate()) {
                total_score += parseInt($('#correct_score').html());
                correct_quiz_count += 1;
                $.toast({
                    title: 'Correct',
                    content: $('#feedback_correct').html(),
                    type: 'success',
                    delay: 3000,
                    dismissible: true,
                });
                $('.preview_btn button').html('Continue');
            } else {
                attempts += 1;
                incorrect_process();
            }
            break;
    }
    // $.toast({
    //     title: 'Incorrect',
    //     content: $('#feedback_incorrect').html(),
    //     type: 'error',
    //     delay: 3000,
    //     dismissible: true,
    // });
}

function evulate() {
    switch ($('#type_id').html()) {
        case '1':
            return $('input[name=answer]:checked').val() == $('#answer').html();
            break;

        case '2':
            var selected_checkbox = $("input[name='answer']:checked");
            var response_answer = '';
            for (const selectedElement of selected_checkbox) {
                response_answer += $(selectedElement).val() + ';';
            }
            return response_answer == $('#answer').html();
            break;
    }
}

function incorrect_process() {
    console.log('incorrect_process function');
}
