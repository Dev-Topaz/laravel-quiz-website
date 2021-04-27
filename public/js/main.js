$('.middle_form_bar').click(function() {
    $(this).next().toggle();
});

$('#add_choice').click(function() {

    var length = $('#answer_content .choice_item').length;

    var id = 1;

    if (length > 0) {
        id = 0;
        for(var i = 0; i < length; i++) {
            if (parseInt($('#answer_content .choice_item input').eq(i).attr('id')) > id) {
                id = parseInt($('#answer_content .choice_item input').eq(i).attr('id')) + 1;
            }
        }
    }

    const element = $('<div class="choice_item"><input type="radio" id="' + id + '" name="answer" value="' + id + '" style="padding-right: 10px;"><label data-editable for="' + id + '">Type content...</label><a onclick="{$(this).parent().remove();}"><i class="fas fa-trash-alt"></i></a></div>');
    $(this).parent().before().prepend(element);
});

$('body').on('click', '[data-editable]', function(){

  var $el = $(this);

  var $input = $('<input style="margin: 0 40px 0 5px;"/>').val( $el.text() );
  $el.replaceWith( $input );

  var save = function(){
    var $label = $('<label data-editable />').text( $input.val() );
    $input.replaceWith( $label );
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
