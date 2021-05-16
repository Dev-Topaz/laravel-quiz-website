function add_select_lists_word(element) {
    let name = element.parent().parent().find('input').eq(0).attr('name');
    if (name === undefined) {
        name = parseInt($('#select_lists input').eq($('#select_lists input').length - 1).attr('name')) + 1;
    }

    element.parent().parent().prepend('<li><div><input type="radio" name="' + name + '" value="Click and Type content..."><label data-editable>Click and Type content...</label></div><a onclick="{$(this).parent().remove();}"><i class="fas fa-trash-alt"></i></a></li>');
}

function add_select_lists_dropdown() {
    $('#select_lists').append('<div class="select_lists_dropdown" contenteditable="true" style="display: inline;"><div class="select_lists_dropdown_body" contenteditable="false"  style="display: inline;"><div class="select_lists_dropdown_content"></div><div class="select_lists_dropdown_arrow" onclick="{$(this).next().toggle();}"><i class="fas fa-chevron-down"></i></div><div class="select_lists_dropdown_menu" contenteditable="false"><ul><li><i onclick="add_select_lists_word($(this));">Add a new word</i></li></ul></div></div></div>&nbsp');
}
