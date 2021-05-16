function add_word(element) {
    element.parent().parent().prepend('<li><label data-editable>Click and Type content...</label><a onclick="{$(this).parent().remove();}"><i class="fas fa-trash-alt"></i></a></li>');
}

function add_fill_word_dropdown() {
    $('#fill_blanks').append('<div class="fill_blanks_dropdown" contenteditable="true" style="display: inline;"><div class="fill_blanks_dropdown_body" contenteditable="false"  style="display: inline;"><div class="fill_blanks_dropdown_content"></div><div class="fill_blanks_dropdown_arrow" onclick="{$(\'.fill_blanks_dropdown_menu\').hide();$(this).next().toggle();}"><i class="fas fa-chevron-down"></i></div><div class="fill_blanks_dropdown_menu" contenteditable="false"><ul><li><i onclick="add_word($(this));">Add a new word</i></li></ul></div></div></div>&nbsp');
}
