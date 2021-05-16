$('.middle_form_bar').click(function() {
    $(this).next().toggle();
});

$('body').on('click', '[data-editable]', function(){

    console.log("clicked");

    const $el = $(this);

    const $input = $('<div contenteditable="true" class="form_view_textbox_editable" style="border: 1px solid black;width: 100%;overflow-y: scroll;">' + $el.html() + '</div>');
    // const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith( $input );

    const save = function () {
        const $label = $('<label data-editable />').html($input.html());
        if ($input.closest('#select_lists').length > 0) {
            $input.prev().val($input.html());
        }
        $input.replaceWith($label);
    };

  $input.one('blur', save).focus();

});
