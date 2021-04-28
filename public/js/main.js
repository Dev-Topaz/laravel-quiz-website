$('.middle_form_bar').click(function() {
    $(this).next().toggle();
});

// multiple choice
function get_choice_item_id() {
    const length = $('#answer_content .choice_item').length;

    let id = 1;

    if (length > 0) {
        id = 0;
        for(let i = 0; i < length; i++) {
            if (parseInt($('#answer_content .choice_item input').eq(i).attr('id')) > id) {
                id = parseInt($('#answer_content .choice_item input').eq(i).attr('id')) + 1;
            }
        }
    }

    return id;
}

function save_choice_data() {
    const length = $('#answer_content .choice_item').length;

    let choice_id_array = '';
    let answer_content_array = '';

    for(let i =0; i < length; i++) {
        choice_id_array += $('#answer_content .choice_item input').eq(i).attr('id') + ';';
        answer_content_array += $('#answer_content .choice_item label').eq(i).html() + ';';
    }

    console.log(choice_id_array, answer_content_array);

    $('input#answer_content_array').val(answer_content_array);
    $('input#choice_id_array').val(choice_id_array);
}

$('#add_choice').click(function() {

    const id = get_choice_item_id();

    const element = $('<div class="choice_item"><input type="radio" id="' + id + '" name="answer" value="' + id + '" style="padding-right: 10px;"><label class="choice_label" data-editable for="' + id + '">Type content...</label><a onclick="{$(this).parent().remove();save_choice_data();}"><i class="fas fa-trash-alt"></i></a></div>');
    $(this).parent().before().prepend(element);

    save_choice_data();
});

/* Multiple Response */
function get_response_item_id() {
    const length = $('#answer_content .response_item').length;

    let id = 1;

    if (length > 0) {
        id = 0;
        for(let i = 0; i < length; i++) {
            if (parseInt($('#answer_content .response_item input').eq(i).attr('id')) > id) {
                id = parseInt($('#answer_content .response_item input').eq(i).attr('id')) + 1;
            }
        }
    }

    return id;
}

function save_response_data() {
    const length = $('#answer_content .response_item').length;

    let response_id_array = '';
    let answer_content_array = '';

    for(let i =0; i < length; i++) {
        response_id_array += $('#answer_content .response_item input').eq(i).attr('id') + ';';
        answer_content_array += $('#answer_content .response_item label').eq(i).html() + ';';
    }

    console.log(response_id_array, answer_content_array);

    $('input#answer_content_array').val(answer_content_array);
    $('input#response_id_array').val(response_id_array);
}

$('#add_response').click(function() {

    const id = get_response_item_id();

    const element = $('<div class="response_item"><input type="checkbox" onclick="responsehandleclick();" id="' + id + '" name="answer' + id + '" value="' + id + '" style="padding-right: 10px;"><label class="response_label" data-editable for="' + id + '">Type content...</label><a onclick="{$(this).parent().remove();save_response_data();}"><i class="fas fa-trash-alt"></i></a></div>');
    $(this).parent().before().prepend(element);

    save_response_data();
});

function responsehandleclick() {
    const length = $('#answer_content .response_item').length;

    let answer_array = '';

    for(let i =0; i < length; i++) {
        if($('#answer_content .response_item input').eq(i)[0].checked) {
            answer_array += $('#answer_content .response_item input').eq(i).attr('id') + ';';
        }
    }

    console.log(answer_array);

    $('input#answer').val(answer_array);
}

$('body').on('click', '[data-editable]', function(){

    const $el = $(this);

    const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith( $input );

    const save = function () {
        const $label = $('<label data-editable />').text($input.val());
        $input.replaceWith($label);
        if($el[0].className == 'choice_label') save_choice_data();
        if($el[0].className == 'response_label') save_response_data();
    };

    /**
    We're defining the callback with `one`, because we know that
    the element will be gone just after that, and we don't want
    any callbacks leftovers take memory.
    Next time `p` turns into `input` this single callback
    will be applied again.
  */
  $input.one('blur', save).focus();

});
