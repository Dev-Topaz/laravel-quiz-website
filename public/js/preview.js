$('div').attr('contenteditable', 'false');

/*
* ************ Fit Quiz size ********************
* */

var w = window.innerWidth;
var h = window.innerHeight;

const elementHeight = 500;

zoomScale = (h - 30 - 42) / elementHeight;

// setZoom(zoomScale, document.getElementsByClassName('quiz_list_container')[0]);

// function setZoom(zoom, el) {
//
//     transformOrigin = [0, 0];
//     el = el || instance.getContainer();
//     var p = ["webkit", "moz", "ms", "o"],
//         s = "scale(" + zoom + ")",
//         oString = (transformOrigin[0] * 100) + "% " + (transformOrigin[1] * 100) + "%";
//
//     for (var i = 0; i < p.length; i++) {
//         el.style[p[i] + "Transform"] = s;
//         el.style[p[i] + "TransformOrigin"] = oString;
//     }
//
//     el.style["transform"] = s;
//     el.style["transformOrigin"] = oString;
//
// }

/*
* For Sequence UI
* */

$('#sortable').sortable();

/*
* ************ For Matching UI ***********
* */

$(function () {
    $(".draggable").draggable({

        start: function () {
            $(this).addClass("ui-state-highlight");
            if ($(this).attr("isdropped")) {
                $(this).parent().css({'justify-content': 'space-around'});
                $(this).attr("isdropped", false);
            }
        },

        stop: function () {
            $(this).removeClass("ui-state-highlight");

        },

        revert: true,
    });
    $(".droppable").droppable({
        classes: {
            "ui-droppable-hover": "ui-state-highlight"
        },
        drop: function (event, ui) {
            $(this).addClass("ui-state-hover");
            $(this).parent().css({'justify-content': 'center'});
            ui.draggable.attr("isdropped", true);

            swap_value(ui.draggable, $(this).next());
        }
    });
});

/*
* ************ For Drag the Words UI ***********
* */
var drag_words_array = [];
$("#slide_drag_words_answer span").draggable({

    start: function () {
        $(this).addClass("ui-state-highlight");
        // if ($(this).attr("isdropped")) {
        // $(this).parent().css({'justify-content': 'space-around'});
        // $(this).attr("isdropped", false);
        // }
    },

    stop: function () {
        $(this).removeClass("ui-state-highlight");

    },

    // revert: true,
});
$("#slide_drag_words_question .blank").droppable({
    classes: {
        "ui-droppable-hover": "ui-state-highlight"
    },
    drop: function (event, ui) {
        console.log('dropped');
        drag_words_array[$(this).index('.blank')] = ui.draggable.html();
        // $(this).parent().css({'justify-content': 'center'});
        // ui.draggable.attr("isdropped", true);

        // swap_value(ui.draggable, $(this).next());
    }
});

function swap_value(a, b) {
    tmp = a.html();
    a.html(b.html());
    b.html(tmp);
}


/*
* ************** Rearrange Preview UI *************
* */

const user_name = $('#user_name').html();
const user_email = $('#user_email').html();

let quizzes = [];
let quizId = 0;
let question_result;
let question_user_point = 0;
let attempts = 0;
let question_feedback;
let question_user_answer = [];
let question_correct_answer = [];

let result;
let total_score = 0;
let correct_quiz_count = 0;
let hotspots_points = [];

rearrange_preview_ui();

function change_input_id_label_for(element_array, quiz_id) {
    for (let i = 0; i < element_array.length; i++) {
        element_array.eq(i).find('input').eq(0).attr('id', quiz_id + '_' + element_array.eq(i).find('input').eq(0).attr('id'));
        element_array.eq(i).find('label').eq(0).attr('for', quiz_id + '_' + element_array.eq(i).find('label').eq(0).attr('for'));
    }
}

function rearrange_preview_ui() {

    $('#question_number').html(quizId + 1);
    $('#question_point span').html($('.quiz_show .correct_score').html());
    $('#total_point').html(total_score);
    $('#passing_score').html($('.quiz_show .passing_score').html())

    switch ($('.quiz_show .type_id').html()) {
        case '1':
            console.log($('.quiz_show .shuffle_answers').html());
            if ($('.quiz_show .shuffle_answers').html() == 0) return;

            var choice_items = $('.quiz_show .choice_item');
            change_input_id_label_for(choice_items, $('.quiz_show .quiz_id').html());

            shuffle(choice_items);

            var rearrange_choice_items = '';
            for (let i = 0; i < choice_items.length; i++) {
                rearrange_choice_items += choice_items[i].outerHTML;
            }

            $('.quiz_show .slide_view_answer_element .col-md-12').html(rearrange_choice_items);
            break;

        case '2':
            console.log($('.quiz_show .shuffle_answers').html());
            if ($('.quiz_show .shuffle_answers').html() == 0) return;

            var response_items = $('.quiz_show .response_item');
            change_input_id_label_for(response_items, $('.quiz_show .quiz_id').html());

            shuffle(response_items);

            var rearrange_response_items = '';
            for (let i = 0; i < response_items.length; i++) {
                rearrange_response_items += response_items[i].outerHTML;
            }

            $('.quiz_show .slide_view_answer_element .col-md-12').html(rearrange_response_items);
            break;

        case '6':
            var sequence_items = $('#sortable li');
            shuffle(sequence_items)

            var rearrange_sequence_sortable = '';
            for (let i = 0; i < sequence_items.length; i++) {
                rearrange_sequence_sortable += sequence_items[i].outerHTML;
            }

            $('#sortable').html(rearrange_sequence_sortable);
            break;

        case '7':
            var matching_content_items = $('.ui-widget-content');
            shuffle(matching_content_items);

            var rearrange_matching = [];
            for (let i = 0; i < matching_content_items.length; i++) {
                rearrange_matching.push($(matching_content_items[i]).html());
            }
            for (let i = 0; i < matching_content_items.length; i++) {
                $('.ui-widget-content').eq(i).html(rearrange_matching[i]);
            }
            break;

        case '11':
            var root_url = $('meta[name=url]').attr('content');

            var canvas_info = $('.quiz_show .correct_answer').html();

            console.log(canvas_info);

            var canvas_bg_url = canvas_info.split('@')[0];

            var json_bg_url = JSON.parse(canvas_bg_url);

            $('.quiz_show .slide_view_answer_element .col-md-12').html('<div id="image-hotspots" style="position: relative;width: 300px;height: 214px;left: 50%;transform: translateX(-50%)"><img src="' + root_url + '/' + json_bg_url.background + '" height="214" width="300" onclick="create_hotspots(event)" style="position: relative;left: 50%;transform: translateX(-50%)"></div>');

            break;

        case '13':
            $('#preview_container .preview_btn button').html('Start Quiz');
            break;

        case '14':
            let passed_score_html = $('.quiz_show .slide_view_answer_element .col-md-12').html();
            console.log(passed_score_html);
            passed_score_html = passed_score_html.split('%%')[0] + total_score + passed_score_html.split('%%')[1];
            passed_score_html = passed_score_html.split('##')[0] + $('.quiz_show .passing_score').html() + passed_score_html.split('##')[1];
            console.log(passed_score_html);

            $('.quiz_show .slide_view_answer_element .col-md-12').html(passed_score_html);
            break;

        case '15':
            let failed_score_html = $('.quiz_show .slide_view_answer_element .col-md-12').html();
            failed_score_html = failed_score_html.split('%%')[0] + total_score + failed_score_html.split('%%')[1];
            failed_score_html = failed_score_html.split('##')[0] + $('.quiz_show .passing_score').html() + failed_score_html.split('##')[1];

            $('.quiz_show .slide_view_answer_element .col-md-12').html(failed_score_html);
            break;
    }
}

function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
}

/*
* ************* For Hotspots UI ***************
* */

function create_hotspots(event) {
    var x = event.offsetX;
    var y = event.offsetY;
    console.log(x, y);
    $('#image-hotspots').append('<div style="top: ' + y + 'px;height: 20px;width: 20px;position: absolute;background: #29b160;border-radius: 50%;cursor: pointer;z-index: 200;margin-left: -10px;margin-top: -10px;left: ' + x + 'px;"></div>');
    hotspots_points.push([x, y]);
}

/*
* ********** question Processing **************
* */

function preview() {
    const root_url = $('meta[name=url]').attr('content');
    const token = $('meta[name=csrf-token]').attr('content');

    switch ($('.preview_btn button').html()) {
        case 'Submit':
            if (!is_completed_question()) {
                show_modal('error', 'Warning', 'You must complete the question before submitting.');
                return;
            }

            if ($('.quiz_show .question_type').html() != 'graded') {
                question_result = 'Survey';
                $('.preview_btn button').html('Continue');
                return;
            }
            if (evulate()) {
                attempts += 1;
                total_score += parseInt($('.quiz_show .correct_score').html());
                question_user_point += parseInt($('.quiz_show .correct_score').html());
                correct_quiz_count += 1;
                if ($('.quiz_show .feedback_type').html() != 'none') {
                    show_modal('success', 'Correct', $('.quiz_show .feedback_correct').html());
                }
                question_feedback = $('.quiz_show .feedback_correct').html();
                question_result = 'Correct';
                $('.preview_btn button').html('Continue');
            } else {
                attempts += 1;
                incorrect_process();
            }
            break;

        case 'Try again':
            $('.preview_btn button').html('Submit');
            break;

        case 'Start Quiz':

            $('#preview_toast').fadeOut(1500);

            attempts = 0;
            question_user_point = 0;

            var current_show_id = $('.quiz_show').attr('id');
            var next_show_id = $('.quiz_show').next().attr('id');
            var type_id = $('.quiz_show').next().find('.type_id').html();

            $('#quiz_list_audio-' + current_show_id.split('-')[1])[0].pause();

            if (next_show_id === undefined || type_id == 14 || type_id == 15) {

                $('.preview_btn button').html('See Result');
            } else {

                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].pause();
                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].currentTime = 0;
                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].play();

                $('#' + current_show_id).removeClass('quiz_show');
                $('#' + current_show_id).addClass('quiz_hide');

                $('#' + next_show_id).removeClass('quiz_hide');
                $('#' + next_show_id).addClass('quiz_show');
                rearrange_preview_ui();
                $('.preview_btn button').html('Submit');
            }


            break;

        case 'Continue':

            $('#preview_toast').fadeOut(1500);

            quizzes.push({
                quizId: quizId,
                question_result: question_result,
                question_content: $('.quiz_show .slide_view_question_element').html(),
                question_point: $('.quiz_show .correct_score').html(),
                question_user_point: question_user_point,
                question_user_answer: question_user_answer,
                question_correct_answer: question_correct_answer,
                question_attempts: $('.quiz_show .attempts').html(),
                question_user_attempts: attempts,
                question_feedback: question_feedback,
            });

            attempts = 0;
            question_user_point = 0;
            quizId++;

            var current_show_id = $('.quiz_show').attr('id');
            var next_show_id = $('.quiz_show').next().attr('id');
            var type_id = $('.quiz_show').next().find('.type_id').html();

            $('#quiz_list_audio-' + current_show_id.split('-')[1])[0].pause();

            if (next_show_id === undefined || type_id == 14 || type_id == 15) {

                $('.preview_btn button').html('See Result');
            } else {

                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].pause();
                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].currentTime = 0;
                $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].play();

                $('#' + current_show_id).removeClass('quiz_show');
                $('#' + current_show_id).addClass('quiz_hide');

                $('#' + next_show_id).removeClass('quiz_hide');
                $('#' + next_show_id).addClass('quiz_show');
                rearrange_preview_ui();
                $('.preview_btn button').html('Submit');
            }


            break;

        case 'See Result':
            if ($('#is_quiz').html() != '0') {

                if (total_score < parseInt($('.quiz_show .passing_score').html())) {
                    result = 'Fail';
                    var current_show_id = $('.quiz_show').attr('id');

                    var next_show_id = $('.quiz_show').next().next().attr('id');
                    if (next_show_id === undefined) return;

                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].pause();
                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].currentTime = 0;
                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].play();

                    $('#' + current_show_id).removeClass('quiz_show');
                    $('#' + current_show_id).addClass('quiz_hide');

                    $('#' + next_show_id).removeClass('quiz_hide');
                    $('#' + next_show_id).addClass('quiz_show');
                    rearrange_preview_ui();
                } else {
                    result = 'Pass';
                    var current_show_id = $('.quiz_show').attr('id');

                    var next_show_id = $('.quiz_show').next().attr('id');
                    if (next_show_id === undefined) return;

                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].pause();
                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].currentTime = 0;
                    $('#quiz_list_audio-' + next_show_id.split('-')[1])[0].play();

                    $('#' + current_show_id).removeClass('quiz_show');
                    $('#' + current_show_id).addClass('quiz_hide');

                    $('#' + next_show_id).removeClass('quiz_hide');
                    $('#' + next_show_id).addClass('quiz_show');
                    rearrange_preview_ui();
                }


                show_preload();
                $.ajax({
                    url: root_url + '/send-mail',
                    type: 'POST',
                    data: {
                        _token: token,
                        user_name: user_name,
                        user_email: user_email,
                        stuff_emails: $('.quiz_show .stuff_emails').html(),
                        exam_answered: correct_quiz_count,
                        exam_question_count: quizId,
                        exam_user_score: total_score,
                        exam_passing_score: $('.quiz_show .passing_score').html(),
                        result: result,
                        quizzes: quizzes,
                    },
                    success: function (data) {
                        console.log('success');
                        hide_preload();
                    }
                }).catch((XHttpResponse) => {
                    console.log(XHttpResponse);
                    hide_preload();
                });
            } else {
                alert('Answered: ' + correct_quiz_count + '/' + quizId + ', Total Score: ' + total_score);
            }

            $('.preview_btn button').html('Close');
            break;

        case 'Close':
            if ($('#is_quiz').html() == '1') {
                location.replace(root_url + '/exams');
            } else {
                window.close();
            }
            break;
    }
}

function is_completed_question() {
    switch ($('.quiz_show .type_id').html()) {
        case '1':
            if ($('.quiz_show input[name=answer]:checked').length > 0) return true;
            return false;
            break;

        case '2':
            if ($('.quiz_show input[name=answer]:checked').length > 0) return true;
            return false;
            break;

        case '3':
            if ($('.quiz_show input[name=answer]:checked').length > 0) return true;
            return false;
            break;

        case '4':
            if ($('.quiz_show #answer').val() != '') return true;
            return false;
            break;

        case '5':
            if ($('.quiz_show #answer').val() != '') return true;
            return false;
            break;

        case '8':

            for (let i = 0; i <$('.quiz_show .slide_view_answer_element input').length; i++) {
                if ($('.quiz_show .slide_view_answer_element input').eq(i).val() == '') return false;
            }
            return true;
            break;

        case '9':
            const select_lists_items = $('.quiz_show .slide_view_answer_element select');

            for (let i = 0; i < select_lists_items.length; i++) {
                if (select_lists_items.eq(i).val() == 'none') return false;
            }

            return true;
            break;

        case '10':
            console.log(drag_words_array);
            console.log($('.quiz_show .slide_view_answer_element .blank').length);
            if (drag_words_array.length != $('.quiz_show .slide_view_answer_element .blank').length) return false;

            for (let i = 0; i < drag_words_array.length; i++) {
                if (drag_words_array[i] == undefined) return false;
            }

            return true;
            break;

        case '11':
            if (hotspots_points.length > 0) return true;
            return false;
            break;

        default:
            return true;
    }
}

function evulate() {
    question_user_answer = [];
    question_correct_answer = [];

    switch ($('.quiz_show .type_id').html()) {
        case '1':
            question_user_answer.push($('.quiz_show input[name=answer]:checked').next().html());
            question_correct_answer.push($('.quiz_show input[value=' + $('.quiz_show .correct_answer').html() + ']').next().html());

            return compare_arrays(question_user_answer, question_correct_answer);
            break;

        case '2':
            var selected_checkbox = $(".quiz_show input[name='answer']:checked");

            for (var i = 0; i < selected_checkbox.length; i++) {
                question_user_answer.push(selected_checkbox.eq(i).next().html());
            }

            let correct_response_answer_array = $('.quiz_show .correct_answer').html().split(';');
            correct_response_answer_array.pop();
            for (var i = 0; i < correct_response_answer_array.length; i++) {
                question_correct_answer.push($('.quiz_show input[value=' + correct_response_answer_array[i] + ']').next().html());
            }

            return compare_arrays(question_user_answer, question_correct_answer);
            // return response_answer == $('.quiz_show .correct_answer').html();
            break;

        case '3':
            question_user_answer.push($('.quiz_show input[name=answer]:checked').next().html());
            question_correct_answer.push($('.quiz_show input[value=' + $('.quiz_show .correct_answer').html() + ']').next().html());

            return $('.quiz_show input[name=answer]:checked').val() == $('.quiz_show .correct_answer').html();
            break;

        case '4':
            question_user_answer.push($('.quiz_show #answer').val());
            question_correct_answer.push($('.quiz_show .correct_answer').html());

            if ($('.quiz_show .case_sensitive').html() == 0) {
                return $('.quiz_show #answer').val().toUpperCase() == $('.quiz_show .correct_answer').html().toUpperCase();
            } else {
                return $('.quiz_show #answer').val() == $('.quiz_show .correct_answer').html();
            }
            break;

        case '5':
            const numeric_answer = parseInt($('.quiz_show #answer').val());
            var correct_answer = $('.quiz_show .correct_answer').html();
            var numeric_answer_array = correct_answer.split('@');
            numeric_answer_array.pop();

            question_user_answer.push($('.quiz_show #answer').val());
            question_correct_answer = numeric_answer_array;

            for (let numeric_item of numeric_answer_array) {
                numeric_item = numeric_item.replace("&lt;", "<").replace("&lt;", "<").replace("&gt;", ">");
                var symbol = numeric_item.split(';')[0];
                switch (symbol) {
                    case '==':
                        if (numeric_answer == parseInt(numeric_item.split(';')[1])) return true;
                        break;

                    case '<<':
                        if ((numeric_answer - parseInt(numeric_item.split(';')[1])) * (numeric_answer - parseInt(numeric_item.split(';')[2])) < 0) return true;
                        break;

                    case '>':
                        if (numeric_answer > parseInt(numeric_item.split(';')[1])) return true;
                        break;

                    case '>=':
                        if (numeric_answer >= parseInt(numeric_item.split(';')[1])) return true;
                        break;

                    case '<':
                        if (numeric_answer < parseInt(numeric_item.split(';')[1])) return true;
                        break;

                    case '<=':
                        if (numeric_answer <= parseInt(numeric_item.split(';')[1])) return true;
                        break;

                    case '!=':
                        if (numeric_answer != parseInt(numeric_item.split(';')[1])) return true;
                        break;
                }
            }

            return false;
            break;

        case '6':
            var sequence_answer = '';
            var sequence_items = $('.quiz_show #sortable li');

            for (let i = 0; i < sequence_items.length; i++) {
                sequence_answer += sequence_items.eq(i).find('label').html() + ';';
            }

            question_user_answer = sequence_answer;
            question_correct_answer = $('.quiz_show .correct_answer').html();

            return sequence_answer == $('.quiz_show .correct_answer').html();
            break;

        case '7':
            const matching_items = $('.quiz_show .slide_view_answer_element .col-md-12 > div');
            let matching_answer = '';
            // detect matching
            for (let i = 0; i < matching_items.length; i++) {
                if (matching_items.eq(i).css('justify-content') != 'center') return false;
                matching_answer += matching_items.eq(i).find('p').eq(0).html() + ';' + matching_items.eq(i).find('p').eq(1).html() + '@';
            }

            question_user_answer = matching_answer;
            question_correct_answer = $('.quiz_show .correct_answer').html();

            return matching_answer == $('.quiz_show .correct_answer').html();
            break;

        case '8':
            var correct_answer = $('.quiz_show .correct_answer').html();
            var correct_answer_array = correct_answer.split('@');
            correct_answer_array.pop();

            let answer_array_items;
            if ($('.quiz_show .case_sensitive').html() == 0) {
                for (let i = 0; i < correct_answer_array.length; i++) {
                    answer_array_items = correct_answer_array[i].toUpperCase().split(';');
                    answer_array_items.pop();
                    if (answer_array_items.indexOf($('.quiz_show .slide_view_answer_element input').eq(i).val().toUpperCase()) == -1) return false;
                }
            } else {
                for (let i = 0; i < correct_answer_array.length; i++) {
                    answer_array_items = correct_answer_array[i].split(';');
                    answer_array_items.pop();
                    if (answer_array_items.indexOf($('.quiz_show .slide_view_answer_element input').eq(i).val()) == -1) return false;
                }
            }

            return true;
            break;

        case '9':
            const select_lists_items = $('.quiz_show .slide_view_answer_element select');
            let select_lists_answer = '';

            for (let i = 0; i < select_lists_items.length; i++) {
                select_lists_answer += select_lists_items.eq(i).val() + ';';
            }

            question_user_answer = select_lists_answer;
            question_correct_answer = $('.quiz_show .correct_answer').html();
            return select_lists_answer == $('.quiz_show .correct_answer').html();
            break;

        case '10':
            let drag_words_answer = '';

            for (let i = 0; i < drag_words_array.length; i++) {
                drag_words_answer += drag_words_array[i] + ';';
            }

            question_user_answer = drag_words_answer;
            question_correct_answer = $('.quiz_show .correct_answer').html();
            return drag_words_answer == $('.quiz_show .correct_answer').html();
            break;

        case '11':
            var root_url = $('meta[name=url]').attr('content');

            var canvas_info = $('.quiz_show .correct_answer').html();

            var canvas_item_info = canvas_info.split('@')[1];

            var json_canvas_item = JSON.parse(canvas_item_info);

            for (let i = 0; i < hotspots_points.length; i++) {
                switch (json_canvas_item.type) {
                    case 'circle':
                        console.log(hotspots_points);
                        console.log(json_canvas_item);
                        if (Math.pow(json_canvas_item.radius, 2) < Math.pow(hotspots_points[0][0] - json_canvas_item.left, 2) + Math.pow(hotspots_points[0][1] - json_canvas_item.top, 2)) return false;
                        break;

                    case 'rect':
                        if (hotspots_points[0][0] < json_canvas_item.left || hotspots_points[0][0] > json_canvas_item.left + json_canvas_item.width || hotspots_points[0][1] < json_canvas_item.top || hotspots_points[0][1] > json_canvas_item.top + json_canvas_item.height) return false;
                        break;

                    case 'polyline':
                        if (!(inside(hotspots_points[0], json_canvas_item.points))) return false;
                        break;
                }
            }

            return true;
            break;
    }
}

/*
* ************* method for hotspot polygen ***********************
* */
function inside(point, vs) {
    // ray-casting algorithm based on
    // https://wrf.ecse.rpi.edu/Research/Short_Notes/pnpoly.html/pnpoly.html

    var x = point[0], y = point[1];

    console.log(x, y);

    var inside = false;
    for (var i = 0, j = vs.length - 1; i < vs.length; j = i++) {
        var xi = vs[i].x, yi = vs[i].y;
        var xj = vs[j].x, yj = vs[j].y;

        var intersect = ((yi > y) != (yj > y))
            && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
        if (intersect) inside = !inside;
    }

    return inside;
};

function incorrect_process() {
    if (attempts == parseInt($('.quiz_show .attempts').html())) {

        total_score += parseInt($('.quiz_show .incorrect_score').html());
        question_user_point += parseInt($('.quiz_show .incorrect_score').html());
        question_result = 'Wrong';
        question_feedback = $('.quiz_show .feedback_incorrect').html();

        $('.preview_btn button').html('Continue');
        if ($('.quiz_show .feedback_type').html() != 'none') {
            show_modal('error', 'Incorrect', $('.quiz_show .feedback_incorrect').html());
        }
    } else {
        total_score += parseInt($('.quiz_show .try_again_score').html());
        question_user_point += parseInt($('.quiz_show .try_again_score').html());
        question_feedback = $('.quiz_show .feedback_try_again').html();

        $('.preview_btn button').html('Try again');
        if ($('.quiz_show .feedback_type').html() != 'none') {
            show_modal('error', 'Incorrect', $('.quiz_show .feedback_try_again').html());
        }
    }
    console.log('incorrect_process function');
}

/*
*************** Compare 2 arrays ***************
*/
function compare_arrays(array1, array2) {
    sorted_array1 = array1.sort(s);
    sorted_array2 = array2.sort(s);

    var is_same = (sorted_array1.length == sorted_array2.length) && sorted_array1.every(function (element, index) {
        return element === sorted_array2[index];
    });

    return is_same;
}

function s(x, y) {
    var pre = ['string', 'number', 'bool']
    if (typeof x !== typeof y) return pre.indexOf(typeof y) - pre.indexOf(typeof x);

    if (x === y) return 0;
    else return (x > y) ? 1 : -1;

}

$('.quiz_show .slide_view_media_element').click(function () {
    image_popup($(this).find('img').attr('src'));
});
