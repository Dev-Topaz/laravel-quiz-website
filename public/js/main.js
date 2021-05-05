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

/* Numeric */
function get_select_item_id() {
    const length = $('#answer_content .select_item').length;

    let id = 1;

    if (length > 0) {
        id = 0;
        for(let i = 0; i < length; i++) {
            if (parseInt($('#answer_content .select_item select:nth-child(1)').eq(i).attr('id')) > id) {
                id = parseInt($('#answer_content .select_item select:nth-child(1)').eq(i).attr('id')) + 1;
            }
        }
    }
    console.log("id", id);
    return id;
}

$('#add_select').change(function() {

    if(this.value !== '+') {
        const id = get_select_item_id();

        let element;

        if (this.value === '<<') {
            element = $('<div class="select_item" style="display: flex;padding: 5px 0;"><select onchange="{select_change(this);}" name="' + id + '" id="' + id + '"><option value="==">Equal to</option><option value="<<">Between</option><option value=">">Greater than</option><option value=">=">Greater than or equal to</option><option value="<">Less than</option><option value="<=">Less than or equal to</option><option value="!=">Not equal to</option></select><div><input type="number" value="0" onchange="{save_select_data();}"><span>and</span><input type="number" value="0" onchange="{save_select_data();}"></div><a onclick="{$(this).parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></div>');
        } else {
            element = $('<div class="select_item" style="display: flex;padding: 5px 0;"><select onchange="{select_change(this);}" name="' + id + '" id="' + id + '"><option value="==">Equal to</option><option value="<<">Between</option><option value=">">Greater than</option><option value=">=">Greater than or equal to</option><option value="<">Less than</option><option value="<=">Less than or equal to</option><option value="!=">Not equal to</option></select><div><input type="number" value="0" onchange="{save_select_data();}"></div><a onclick="{$(this).parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></div>');
        }
        $(this).parent().before().prepend(element);
        $('select#' + id).val(this.value);
    }

    $(this).val('+');
    save_select_data();
});

function select_change(select) {
    if (select.value === '<<') {
        $(select).next().html('<input type="number" value="0" onchange="{save_select_data();}"><span>and</span><input type="number" value="0" onchange="{save_select_data();}">');
    } else {
        $(select).next().html('<input type="number" value="0" onchange="{save_select_data();}">');
    }
    save_select_data();
}

function save_select_data() {
    const length = $('#answer_content .select_item').length;

    let select_answer_array = '';

    for(let i =0; i < length; i++) {
        let value = $('#answer_content .select_item:nth-child('+ (i + 1) + ') select').val();
        select_answer_array += value + ';';
        if(value === '<<') {
            select_answer_array += $('#answer_content .select_item:nth-child('+ (i + 1) + ') input:nth-child(1)').val() + ';' + $('#answer_content .select_item:nth-child('+ (i + 1) + ') input:nth-child(1)').next().next().val() + '@';
        } else {
            select_answer_array += $('#answer_content .select_item:nth-child('+ (i + 1) + ') input:nth-child(1)').val() + ';' + '@';
        }
    }

    console.log(select_answer_array);
    $('input#select_answer').val(select_answer_array);
}

/* Sequence */
$('#add_sequence').click(function() {
    console.log($(this));
     let element;

     element = '<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>Type content...</label><a onclick="{$(this).parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></li>';

     $(this).prev().prepend(element);

});

/* Matching */
$('#add_matching').click(function() {
    console.log($(this));
     let element;

     element = '<li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="matching_item_label" data-editable>Type item content...</label><div style="border-right: 1px black solid;width: 30px;"></div><label class="matching_label" data-editable>Type matching content...</label><a onclick="{$(this).parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></li>';

     $(this).prev().prepend(element);

});

$('body').on('click', '[data-editable]', function(){

    console.log("clicked");

    const $el = $(this);

    const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith( $input );

    const save = function () {
        const $label = $('<label data-editable />').text($input.val());
        $input.replaceWith($label);
        if($el[0].className === 'choice_label') save_choice_data();
        if($el[0].className === 'response_label') save_response_data();
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
