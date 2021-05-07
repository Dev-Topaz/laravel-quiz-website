$('.middle_form_bar').click(function() {
    $(this).next().toggle();
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

  $input.one('blur', save).focus();

});
