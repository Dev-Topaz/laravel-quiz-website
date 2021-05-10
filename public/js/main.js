$('.middle_form_bar').click(function() {
    $(this).next().toggle();
});

$('body').on('click', '[data-editable]', function(){

    console.log("clicked");

    const $el = $(this);

    const $input = $('<div contenteditable="true" class="form_view_textbox_editable" style="border: 1px solid black;width: 100%;overflow-y: scroll;">' + $el.text() + '</div>');
    // const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith( $input );

    const save = function () {
        const $label = $('<label data-editable />').text($input.text());
        $input.replaceWith($label);
        if($el[0].className === 'choice_label') save_choice_data();
        if($el[0].className === 'response_label') save_response_data();
    };

  $input.one('blur', save).focus();

});
