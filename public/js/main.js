$('.middle_form_bar').click(function() {
    $(this).next().toggle();
});

/* Sequence */


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
