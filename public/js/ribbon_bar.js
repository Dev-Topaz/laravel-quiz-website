var remove_link = false;
var clipboard_str = '';


// $('#target_element').val();

// template function
$('#xxxxx').click(function () {});
$('#xxxxx').mousedown(function (e) {
    e.preventDefault();
});

//=========================================
//
//          Copy Cut Paste
//
//=========================================

// Copy btn click function
$('.copy_btn').click(function () {
    clipboard_str = get_selected_str();
});

$('.copy_btn').mousedown(function (e) {
    e.preventDefault();
});


// cut function
$('.cut_btn').click(function () {
    clipboard_str = get_selected_str();
    delete_selected_str();
});

$('.cut_btn').mousedown(function (e) {
    e.preventDefault();
});


// Paste btn click function
$('.paste_btn').click(function () {
    paste_str(clipboard_str);
    // window.getSelection().removeAllRanges();
    // sel.focusOffset
    // setCurrentCursorPosition(get_cursor_pos_supposed_to_be(clipboard_str));
});

$('.paste_btn').mousedown(function (e) {
    e.preventDefault();
});

//  https://raw.githubusercontent.com/Sophie627/flutter-Enriched-Digital-Writer-re-build/master/lib/widget/texteditor/divelement.dart

function get_selected_str() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        return (sel.toString());
    }
    return ('');
}

function delete_selected_str() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var range = sel.getRangeAt(0);
        range.deleteContents();
    }
}

function paste_str(str) {
    var sel = window.getSelection();

    if (sel.rangeCount) {
        var e = document.createElement('span');
        // e.style = 'font-family:' + font.value + ';';
        e.innerHTML = str;
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function createRange(node, chars, range) {
    if (!range) {
        range = document.createRange()
        range.selectNode(node);
        range.setStart(node, 0);
    }

    if (chars.count === 0) {
        range.setEnd(node, chars.count);
    } else if (node && chars.count > 0) {
        if (node.nodeType === Node.TEXT_NODE) {
            if (node.textContent.length < chars.count) {
                chars.count -= node.textContent.length;
            } else {
                range.setEnd(node, chars.count);
                chars.count = 0;
            }
        } else {
            for (var lp = 0; lp < node.childNodes.length; lp++) {
                range = createRange(node.childNodes[lp], chars, range);

                if (chars.count === 0) {
                    break;
                }
            }
        }
    }
    return range;
};

function setCurrentCursorPosition(chars) {
    if (chars >= 0) {
        var selection = window.getSelection();

        range = createRange(document.getElementsByClassName("slide_view_question_element")[0], {
            count: chars
        });

        if (range) {
            range.collapse(false);
            selection.removeAllRanges();
            selection.addRange(range);
        }
    }
};

function get_cursor_pos_supposed_to_be(str) {
    var el = document.getElementsByClassName('slide_view_question_element')[0].innerText;
    return (el.lastIndexOf(str) + str.length);
}

//=========================================
//
//          Font Family Settings
//
//  **********************************
//  range.startContainer.style.fontSize ...
//  range.endContainer => text then use default val
//  **********************************
//=========================================

// Font Family Select
$('#slide_view_font_family_selector').change(function () {
    // changeFont($(this).val());
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        element.css('font-family', $(this).val());
        if (element.find('label').length > 0) element.find('label').css('font-family', $(this).val());
        if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-family', $(this).val());
        if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-family', $(this).val());
        if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-family', $(this).val());
        if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-family', $(this).val());
       
    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('fontName', false, $(this).val());
    }
});

var fontSize = 16;
var changing_font_size_for_answer_element = parseInt($('#font_size_selector').val());

// Font size select
$('#font_size_selector').change(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        element.css('font-size', $(this).val() + 'px');
        if (element.find('label').length > 0) element.find('label').css('font-size', $(this).val() + 'px');
        if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-size', $(this).val() + 'px');
        if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-size', $(this).val() + 'px');
        if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-size', $(this).val() + 'px');
        if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-size', $(this).val() + 'px');

        changing_font_size_for_answer_element = parseInt($('#font_size_selector').val());
    } else {
        fontSize = parseInt($('#font_size_selector').val());
        document.execCommand("fontSize", false, "1");
        resetFont();
    }
});

function resetFont() {
    $("font[size=1]").removeAttr("size").css("font-size", fontSize + "px");
    var tmp = $('.slide_view_question_element.selected_slide_view_group .cancel_drag').html();
    tmp = tmp.split('x-small').join(fontSize + 'px');
    $('.slide_view_question_element.selected_slide_view_group .cancel_drag').html(tmp);
}

// Font size increase
$('#font_size_bigger_btn').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        if (changing_font_size_for_answer_element < 100) changing_font_size_for_answer_element += 2;
        element.css('font-size', changing_font_size_for_answer_element);
        if (element.find('label').length > 0) element.find('label').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-size', changing_font_size_for_answer_element);
        if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-size', changing_font_size_for_answer_element);

        $('#font_size_selector').val(changing_font_size_for_answer_element);
    } else {
        if (fontSize < 100) fontSize += 2;
        document.execCommand("fontSize", false, "1");
        $('#font_size_selector').val(fontSize);
        resetFont();
    }
});

// Font size decrease
$('#font_size_smaller_btn').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        if (changing_font_size_for_answer_element > 6) changing_font_size_for_answer_element -= 2;
        element.css('font-size', changing_font_size_for_answer_element);
        if (element.find('label').length > 0) element.find('label').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-size', changing_font_size_for_answer_element);
        if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-size', changing_font_size_for_answer_element);
        if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-size', changing_font_size_for_answer_element);

        $('#font_size_selector').val(changing_font_size_for_answer_element);
    } else {
        if (fontSize > 6) fontSize -= 2;
        document.execCommand("fontSize", false, "1");
        $('#font_size_selector').val(fontSize);
        resetFont();
    }

});

// Font style clear
$('#font_style_clear_btn').click(function () {

    $('#slide_view_font_family_selector').val('Arial');
    $('#font_size_selector').val('16');
    fontSize = 16;
    changing_font_size_for_answer_element = 16;

    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        element.css('font-size', '16px');
        element.css('font-style', 'normal');
        element.css('font-weight', 'normal');
        element.css('font-family', 'Arial');
        element.css('color', 'black');
        element.css('text-decoration', 'none');

        if (element.find('label').length > 0) {
            element.find('label').css('font-size', '16px');
            element.find('label').css('font-style', 'normal');
            element.find('label').css('font-weight', 'normal');
            element.find('label').css('font-family', 'Arial');
            element.find('label').css('color', 'black');
            element.find('label').css('text-decoration', 'none');
        }

        if (element.find('.ui-widget-header').length > 0) {
            element.find('.ui-widget-header').css('font-size', '16px');
            element.find('.ui-widget-header').css('font-style', 'normal');
            element.find('.ui-widget-header').css('font-weight', 'normal');
            element.find('.ui-widget-header').css('font-family', 'Arial');
            element.find('.ui-widget-header').css('color', 'black');
            element.find('.ui-widget-header').css('text-decoration', 'none');
        }

        if (element.find('.ui-widget-content').length > 0) {
            element.find('.ui-widget-content').css('font-size', '16px');
            element.find('.ui-widget-content').css('font-style', 'normal');
            element.find('.ui-widget-content').css('font-weight', 'normal');
            element.find('.ui-widget-content').css('font-family', 'Arial');
            element.find('.ui-widget-content').css('color', 'black');
            element.find('.ui-widget-content').css('text-decoration', 'none');
        }

        if (element.find('#slide_drag_words_answer').length > 0) {
            element.find('#slide_drag_words_answer').find('span').css('font-size', '16px');
            element.find('#slide_drag_words_answer').find('span').css('font-style', 'normal');
            element.find('#slide_drag_words_answer').find('span').css('font-weight', 'normal');
            element.find('#slide_drag_words_answer').find('span').css('font-family', 'Arial');
            element.find('#slide_drag_words_answer').find('span').css('color', 'black');
            element.find('#slide_drag_words_answer').find('span').css('text-decoration', 'none');
        } 

        if (element.find('.select_lists_dropdown_body').length > 0) {
            element.find('.select_lists_dropdown_body').find('select').css('font-size', '16px');
            element.find('.select_lists_dropdown_body').find('select').css('font-style', 'normal');
            element.find('.select_lists_dropdown_body').find('select').css('font-weight', 'normal');
            element.find('.select_lists_dropdown_body').find('select').css('font-family', 'Arial');
            element.find('.select_lists_dropdown_body').find('select').css('color', 'black');
            element.find('.select_lists_dropdown_body').find('select').css('text-decoration', 'none');
        }

    } else {
        clear_formatting();
    }
});

var formatting_bold = false;

// Font bold toggle
$('.font_bold_btn').click(function () {
    // toggle_bold(formatting_bold);

    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        formatting_bold = !formatting_bold;
        if (formatting_bold) {
            element.css('font-weight', 'bold');
            if (element.find('label').length > 0) element.find('label').css('font-weight', 'bold');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-weight', 'bold');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-weight', 'bold');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-weight', 'bold');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-weight', 'bold');
        } else {
            element.css('font-weight', 'normal');
            if (element.find('label').length > 0) element.find('label').css('font-weight', 'normal');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-weight', 'normal');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-weight', 'normal');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-weight', 'normal');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-weight', 'normal');
        }
    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('bold');
    }
});

var formatting_strike = false;

// Font strikethrough toggle
$('#slide_view_font_strike_btn').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        formatting_strike = !formatting_strike;
        if (formatting_strike) {
            element.css('text-decoration', 'line-through');
            if (element.find('label').length > 0) element.find('label').css('text-decoration', 'line-through');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('text-decoration', 'line-through');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('text-decoration', 'line-through');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('text-decoration', 'line-through');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('text-decoration', 'line-through');
        } else {
            element.css('text-decoration', 'none');
            if (element.find('label').length > 0) element.find('label').css('text-decoration', 'none');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('text-decoration', 'none');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('text-decoration', 'none');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('text-decoration', 'none');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('text-decoration', 'none');
        }
    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('strikeThrough');
    }
});

var formatting_ital = false;

// Font italic toggle
$('.font_ital_btn').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        formatting_ital = !formatting_ital;
        if (formatting_ital) {
            element.css('font-style', 'italic');
            if (element.find('label').length > 0) element.find('label').css('font-style', 'italic');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-style', 'italic');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-style', 'italic');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-style', 'italic');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-style', 'italic');

        } else {
            element.css('font-style', 'normal');
            if (element.find('label').length > 0) element.find('label').css('font-style', 'normal');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('font-style', 'normal');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('font-style', 'normal');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('font-style', 'normal');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('font-style', 'normal');
        }
    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('italic');
    }
});

var formatting_underline = false;
// Font underline toggle
$('.font_underline_btn').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        formatting_underline = !formatting_underline;
        if (formatting_underline) {
            element.css('text-decoration', 'underline');
            if (element.find('label').length > 0) element.find('label').css('text-decoration', 'underline');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('text-decoration', 'underline');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('text-decoration', 'underline');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('text-decoration', 'underline');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('text-decoration', 'underline');
        } else {
            element.css('text-decoration', 'none');
            if (element.find('label').length > 0) element.find('label').css('text-decoration', 'none');
            if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('text-decoration', 'none');
            if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('text-decoration', 'none');
            if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('text-decoration', 'none');
            if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('text-decoration', 'none');
        }
    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('underline');
    }
});

var formatting_subscript = false;

$('.font_subscription_btn').click(function () {


    formatting_subscript = !formatting_subscript;
    // toggle_subscript(formatting_subscript);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('subscript');
});

var formatting_superscript = false;

$('.font_superscription_btn').click(function () {


    formatting_superscript = !formatting_superscript;
    // toggle_superscript(formatting_superscript);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('superscript');
});

$('#font_picker_trigger').click(function () {
    // $('#font_color_picker').trigger('click');
});

$('#font_picker_trigger').mousedown(function (e) {
    e.preventDefault();
});

$('#office_color_picker').mousedown(function (e) {
    e.preventDefault();
});

// Font color select
$("#office_color_picker").on("change.color", function (event, color) {
    var element = $('.selected_slide_view_group'); // get selected element
    if (element.hasClass('slide_view_answer_element')) {
        element.css('color', color);
        if (element.find('label').length > 0) element.find('label').css('color', color);
        if (element.find('.ui-widget-header').length > 0) element.find('.ui-widget-header').css('color', color);
        if (element.find('.ui-widget-content').length > 0) element.find('.ui-widget-content').css('color', color);
        if (element.find('#slide_drag_words_answer').length > 0) element.find('#slide_drag_words_answer').find('span').css('color', color);
        if (element.find('.select_lists_dropdown_body').length > 0) element.find('.select_lists_dropdown_body').find('select').css('color', color);

    } else {
        document.execCommand('styleWithCSS', false, true);
        document.execCommand('foreColor', false, color);
    }

    if (element.find('span').length > 0) element.find('span').css('color', color);
    // event.preventDefault();
    // change_font_color(color);
});

function change_font_color(color) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.style = 'color: ' + color + ';';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_superscript(formatting_superscript) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_superscript) e.style = 'vertical-align: super;';
        else e.style = 'vertical-align: unset;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_subscript(formatting_subscript) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_subscript) e.style = 'vertical-align: sub;';
        else e.style = 'vertical-align: unset;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_strike(formatting_strike) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_strike) e.style = 'text-decoration: line-through;';
        else e.style = 'text-decoration: none;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_underline(formatting_underline) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_underline) e.style = 'text-decoration: underline;';
        else e.style = 'text-decoration: none;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_ital(formatting_ital) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_ital) e.style = 'font-style: italic;';
        else e.style = 'font-style: normal;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function toggle_bold(formatting_bold) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        if (formatting_bold) e.style = 'font-weight: bold;';
        else e.style = 'font-weight: 400;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function changeFont(font_family) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.style = 'font-family:' + font_family + ';';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function clear_formatting() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.style = "font-family: 'arial'; font-size: 12px; color: black;";
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

function changeFont_size(font_size) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.style = 'font-size:' + font_size + 'px;';
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}


//==============================================
//
//          Paragraph styling
//
//==============================================

var para_numbering = false;

$('.numbering_btn').click(function () {
    // para_numbering = !para_numbering;
    // create_numbering(para_numbering);


    document.execCommand('insertOrderedList');
});

function create_numbering(para_numbering) {
    el = document.getElementsByClassName('slide_view_question_element')[0];

    if (para_numbering) {
        $('.slide_view_question_element').eq(0).find('span.buuuuullet').remove();

        nodes = el.childNodes;
        for (i = 0; i < nodes.length; i++) {
            nodes[i].innerHTML = '<span class="nuuumbering">' + (i + 1) + '. ' + '</span>' + ' ' + nodes[i].innerText;
        }
    } else {
        // document.getElementsByClassName('nuuumbering').remove();
        $('.slide_view_question_element').eq(0).find('span.nuuumbering').remove();
    }
}

var para_bullet = false;

$('.bullet_btn').click(function () {
    // para_bullet = !para_bullet;
    // create_bullet(para_bullet);

    
    document.execCommand('insertUnorderedList', false);
});

function create_bullet(para_bullet) {
    el = document.getElementsByClassName('slide_view_question_element')[0];

    if (para_bullet) {
        $('.slide_view_question_element').eq(0).find('span.nuuumbering').remove();
        nodes = el.childNodes;
        for (i = 0; i < nodes.length; i++) {
            nodes[i].innerHTML = '<span class="buuuuullet">&bull;</span>' + ' ' + nodes[i].innerText;
        }
    } else {
        // document.getElementsByClassName('buuuuullet').remove();
        $('.slide_view_question_element').eq(0).find('span.buuuuullet').remove();
    }
}

$('#paragraph_align_left').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'left');
    if (element.find('.choice_item').length > 0) element.find('.choice_item').css('justify-content', 'flex-start');
    if (element.find('.response_item').length > 0) element.find('.response_item').css('justify-content', 'flex-start');
});

$('#paragraph_align_center').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'center');
    if (element.find('.choice_item').length > 0) element.find('.choice_item').css('justify-content', 'center');
    if (element.find('.response_item').length > 0) element.find('.response_item').css('justify-content', 'center');
});

$('#paragraph_align_right').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'right');
    if (element.find('.choice_item').length > 0) element.find('.choice_item').css('justify-content', 'flex-end');
    if (element.find('.response_item').length > 0) element.find('.response_item').css('justify-content', 'flex-end');
});

$('#paragraph_align_justify').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'justify');
});

$('#paragraph_line_spacing_100').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('line-height', '1');
});

$('#paragraph_line_spacing_115').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('line-height', '1.15');
});

$('#paragraph_line_spacing_150').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('line-height', '1.5');
});

$('#paragraph_line_spacing_200').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('line-height', '2');
});

$('#paragraph_line_spacing_option').click(function () {
    // show modal
});

var paragraph_line_spacing_add_before = false;
$('#paragraph_line_spacing_add_before').click(function () {
    paragraph_line_spacing_add_before = !paragraph_line_spacing_add_before;
    if (!paragraph_line_spacing_add_before) $(this).find('a').eq(0).text('Add Space Before Paragraph');
    else $(this).find('a').eq(0).text('Remove Space Before Paragraph');
    add_line_spacing_before(paragraph_line_spacing_add_before);
});

$('#paragraph_line_spacing_add_before').mousedown(function (e) {
    e.preventDefault();
});

var paragraph_line_spacing_add_after = false;
$('#paragraph_line_spacing_add_after').click(function () {
    paragraph_line_spacing_add_after = !paragraph_line_spacing_add_after;
    if (!paragraph_line_spacing_add_after) $(this).find('a').eq(0).text('Add Space After Paragraph');
    else $(this).find('a').eq(0).text('Remove Space After Paragraph');
    add_line_spacing_after(paragraph_line_spacing_add_after);
});

$('#paragraph_line_spacing_add_after').mousedown(function (e) {
    e.preventDefault();
});

function add_line_spacing_after(paragraph_line_spacing_add_after) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
        while (!(e.parentElement.classList.contains('slide_view_question_element'))) {
            e = e.parentElement
        }
        if (paragraph_line_spacing_add_after)
            e.style.marginBottom = '25px';
        else
            e.style.marginBottom = 'unset';
    }
}

function add_line_spacing_before(paragraph_line_spacing_add_before) {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
        while (!(e.parentElement.classList.contains('slide_view_question_element'))) {
            e = e.parentElement
        }
        if (paragraph_line_spacing_add_before)
            e.style.marginTop = '25px';
        else
            e.style.marginTop = 'unset';
    }
}

// $('#slide_view_paragraph_style_decrease_indent_btn').click(function () {
//     decrease_indent();
// });
$('.decrease_indent').click(function () {
    decrease_indent();
});

$('.decrease_indent').mousedown(function (e) {
    e.preventDefault();
});

$('.increase_indent').click(function () {

    increase_indent();
});

$('.increase_indent').mousedown(function (e) {
    e.preventDefault();
});

function decrease_indent() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
        while (!((e.parentElement.classList.contains('slide_view_question_element')) || (e.parentElement.classList.contains('form_view_question_element')))) {
            e = e.parentElement
        }
        if (e.style.marginLeft == '' || e.style.marginLeft == '0px')
            e.style.marginLeft = '0px';
        else
            e.style.marginLeft = parseInt(e.style.marginLeft) - 10 + 'px';
    }
}

function increase_indent() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        e.innerHTML = sel.toString();
        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
        while (!((e.parentElement.classList.contains('slide_view_question_element')) || (e.parentElement.classList.contains('form_view_question_element')))) {
            e = e.parentElement
        }
        if (e.style.marginLeft == '' || e.style.marginLeft == '0px')
            e.style.marginLeft = '10px';
        else
            e.style.marginLeft = parseInt(e.style.marginLeft) + 10 + 'px';
    }
}

//=========================================================================
//
//          Slide View => Home / Drawing
//
//=========================================================================

$('.shape_effect_shadow_sample').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('box-shadow', $(this).attr('data-style'));
});
$('.shape_effect_glow_sample').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('box-shadow', $(this).attr('data-style'));
});

$('#arrange_bring_forward').click(function () {

    var elements = $('.slide_view_group');
    var len = elements.length;
    for (let i = 0; i < len; i++) {
        if (elements.eq(i).css('display') != 'none') elements.eq(i).addClass('displayed_block');
    }

    var elements = $('.displayed_block');
    var len = elements.length;
    var selected_el = $('.selected_slide_view_group').eq(0); // get selected element
    var zIndex_of_selected_el = parseInt(selected_el.css('z-index'));
    var zIndex_list = [];

    for (let i = 0; i < len; i++) {
        zIndex_list.push(parseInt(elements.eq(i).css('z-index')));
    }

    var isOnTop = true;
    for (let i = 0; i < len; i++) {
        if (zIndex_list[i] == zIndex_of_selected_el + 1) {
            elements.eq(i).css('z-index', zIndex_list[i] - 1);
            isOnTop = false;
        }
    }
    if (!isOnTop)
        selected_el.css('z-index', zIndex_of_selected_el + 1);
});

$('#arrange_send_backward').click(function () {
    var elements = $('.slide_view_group');
    var len = elements.length;
    for (let i = 0; i < len; i++) {
        if (elements.eq(i).css('display') != 'none') elements.eq(i).addClass('displayed_block');
    }

    var elements = $('.displayed_block');
    var len = elements.length;
    var selected_el = $('.selected_slide_view_group').eq(0); // get selected element
    var zIndex_of_selected_el = parseInt(selected_el.css('z-index'));
    var zIndex_list = [];

    for (let i = 0; i < len; i++) {
        zIndex_list.push(parseInt(elements.eq(i).css('z-index')));
    }

    var isAtBottom = true;
    for (let i = 0; i < len; i++) {
        if (zIndex_list[i] == zIndex_of_selected_el - 1) {
            elements.eq(i).css('z-index', zIndex_list[i] + 1);
            isAtBottom = false;
        }
    }
    if (!isAtBottom)
        selected_el.css('z-index', zIndex_of_selected_el - 1);
});

$('#arrange_bring_front').click(function () {
    var elements = $('.slide_view_group');
    var len = elements.length;
    for (let i = 0; i < len; i++) {
        if (elements.eq(i).css('display') != 'none') elements.eq(i).addClass('displayed_block');
    }

    var elements = $('.displayed_block');
    var len = elements.length;
    var selected_el = $('.selected_slide_view_group').eq(0); // get selected element
    var zIndex_of_selected_el = parseInt(selected_el.css('z-index'));
    var zIndex_list = [];

    for (let i = 0; i < len; i++) {
        zIndex_list.push(parseInt(elements.eq(i).css('z-index')));
    }

    for (let i = 0; i < len; i++) {
        if (zIndex_list[i] > zIndex_of_selected_el) {
            elements.eq(i).css('z-index', zIndex_list[i] - 1);
        }
    }
    selected_el.css('z-index', '3');
});

$('#arrange_send_back').click(function () {

    var elements = $('.slide_view_group');
    var len = elements.length;
    for (let i = 0; i < len; i++) {
        if (elements.eq(i).css('display') != 'none') elements.eq(i).addClass('displayed_block');
    }

    var elements = $('.displayed_block');
    var len = elements.length;
    var selected_el = $('.selected_slide_view_group').eq(0); // get selected element
    var zIndex_of_selected_el = parseInt(selected_el.css('z-index'));
    var zIndex_list = [];

    for (let i = 0; i < len; i++) {
        zIndex_list.push(parseInt(elements.eq(i).css('z-index')));
    }

    for (let i = 0; i < len; i++) {
        if (zIndex_list[i] < zIndex_of_selected_el) {
            elements.eq(i).css('z-index', zIndex_list[i] + 1);
        }
    }
    selected_el.css('z-index', '1');
});

$('#rotate_right').click(function () {
    var elements = $('.selected_slide_view_group'); // get selected element
    for (let i = 0; i < elements.length; i++) {
        element = elements.eq(i);
        if (element.attr('rotate') == undefined || element.attr('rotate') == '0') {
            element.attr('rotate', '90');
            element.css('transform', 'rotate(90deg)');
            continue;
        }
        if (element.attr('rotate') == '90') {
            element.attr('rotate', '180');
            element.css('transform', 'rotate(180deg)');
            continue;
        }
        if (element.attr('rotate') == '180') {
            element.attr('rotate', '270');
            element.css('transform', 'rotate(270deg)');
            continue;
        }
        if (element.attr('rotate') == '270') {
            element.attr('rotate', '0');
            element.css('transform', 'rotate(0deg)');
            continue;
        }
    }
});

$('#rotate_left').click(function () {
    var elements = $('.selected_slide_view_group'); // get selected element
    for (let i = 0; i < elements.length; i++) {
        element = elements.eq(i)
        if (element.attr('rotate') == undefined || element.attr('rotate') == '0') {
            element.attr('rotate', '270');
            element.css('transform', 'rotate(270deg)');
            continue;
        }
        if (element.attr('rotate') == '270') {
            element.attr('rotate', '180');
            element.css('transform', 'rotate(180deg)');
            continue;
        }
        if (element.attr('rotate') == '180') {
            element.attr('rotate', '90');
            element.css('transform', 'rotate(90deg)');
            continue;
        }
        if (element.attr('rotate') == '90') {
            element.attr('rotate', '0');
            element.css('transform', 'rotate(0deg)');
            continue;
        }
    }
});

$('#align_left').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('left', '20px');
});

$('#align_right').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_width = parent_el.width();

    var elements = $('.selected_slide_view_group'); // get selected element
    var el_num = elements.length;
    for (let i = 0; i < el_num; i++) {
        var element = elements.eq(i);
        element.css('left', parent_width - element.outerWidth() - 20);
    }
});


$('#align_center').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_width = parent_el.width();

    var elements = $('.selected_slide_view_group'); // get selected element
    var ele_count = elements.length;
    for (let i = 0; i < ele_count; i++) {
        element = elements.eq(i);
        element.css('left', (parent_width - element.outerWidth()) / 2 + 'px');
    }

});

$('#align_top').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('top', '20px');

});

$('#align_bottom').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_height = parent_el.height();
    var elements = $('.selected_slide_view_group'); // get selected element
    var el_num = elements.length;
    for (let i = 0; i < el_num; i++) {
        var element = elements.eq(i);
        element.css('top', parent_height - element.outerHeight() - 20);
    }

});

$('#align_middle').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_height = parent_el.height();
    var elements = $('.selected_slide_view_group'); // get selected element
    var ele_count = elements.length;
    for (let i = 0; i < ele_count; i++) {
        element = elements.eq(i);
        element.css('top', (parent_height - element.outerHeight()) / 2 + 'px');
    }
});

$('#distribute_vertically').click(function () {
    var height_sum = 0;
    var elements = $('.selected_slide_view_group'); // get selected element
    var ele_count = elements.length;
    for (let i = 0; i < ele_count; i++) {
        height_sum += elements.eq(i).outerHeight();
    }
    var gap = ($('#slide_view_container').height() - height_sum) / (ele_count + 1);
    for (let i = 0; i < ele_count; i++) {
        var height_to_set_sum = 0;
        for (let j = 0; j < i; j++) {
            height_to_set_sum += elements.eq(j).outerHeight();
        }
        elements.eq(i).css('top', height_to_set_sum + gap * (i + 1) + 'px');
    }
});

$('#distribute_horizontally').click(function () {
    var width_sum = 0;
    var elements = $('.selected_slide_view_group'); // get selected element
    ele_count = elements.length;
    for (let i = 0; i < ele_count; i++) {
        width_sum += elements.eq(i).outerWidth();
    }
    var gap = ($('#slide_view_container').width() - width_sum) / (ele_count + 1);
    for (let i = 0; i < ele_count; i++) {
        var width_to_set_sum = 0;
        for (let j = 0; j < i; j++) {
            width_to_set_sum += elements.eq(j).outerWidth();
        }
        elements.eq(i).css('left', width_to_set_sum + gap * (i + 1) + 'px');
    }
});

$('.quick_style_sample').click(function () {

    var element = $('.selected_slide_view_group'); // get selected element
    // var element = $('.slide_view_question_element').eq(0);
    element.css('border-color', $(this).css('border-color'));
    element.css('border-width', $(this).css('border-width'));
    element.css('border-style', $(this).css('border-style'));
    element.css('color', $(this).css('color'));
    element.css('background-image', $(this).css('background-image'));
    // element.css('box-shadow', $(this).css('box-shadow'));
    if ($(this).css('background').indexOf('repeating-conic-gradient(rgb') == -1) {
        element.css('background', $(this).css('background'));
    } else {
        element.css('background', 'rgba' + $(this).css('background').split('repeating-conic-gradient(rgb')[1].split(') 0deg,')[0] + ', 0.7)');
    }
});

$('.quick_style_sample_none').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('border', 'none');
    element.css('background', 'none');
    element.css('color', 'black');
});

$('.quick_style_sample').mousedown(function (e) {
    e.preventDefault();
});

$('#office_color_picker').colorpicker({
    color: '#ffffff',
    defaultPalette: 'theme'
});

$('#shape_fill_color_picker').colorpicker({
    color: '#ffffff',
    defaultPalette: 'theme'
});

$('#shape_outline_color_picker').colorpicker({
    color: '#000000',
    defaultPalette: 'theme'
});

// triggered when a color is selected.
$("#shape_fill_color_picker").on("change.color", function (event, color) {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('background', color);
});

$("#shape_outline_color_picker").on("change.color", function (event, color) {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('border', '3px solid ' + color);
});


//========================================================
//
//               Design => Themes
//
//========================================================


$('.design_themes_panels').click(function () {
    $('#slide_view_container').eq(0).css('background', 'unset');
    $('#slide_view_container').eq(0).css('font-family', $(this).css('font-family'));
    $('#slide_view_container').eq(0).css('color', $(this).css('color'));
    $('#slide_view_container').eq(0).css('background-image', $(this).css('background-image'));
    $('#slide_view_container').eq(0).css('background-size', '100% 100%');
    $('#slide_view_container').eq(0).css('background-repeat', 'no-repeat');

    var style = "background: unset; font-fmily:" + $(this).css('font-family') + "; color:" + $(this).css('color') + "; background-image:" + $(this).css('background-image') + "; background-size: 100% 100%; background-repeat: no-repeat; ";

    store_theme_style(style);

});
$('.design_themes_panels').mousedown(function (e) {
    e.preventDefault();
});


//====================================================
//
//              Insert panel functions
//
//====================================================

// $('#layout_reset_btn').click(function () {
//     var sel = window.getSelection()
//     let range = new Range();
//     var content = sel.cloneContents();
// });


//================================
//
//          Modal
//
//================================
var recording_panel_holder = document.getElementById("recording_panel_holder");

var edit_hyperlink_modal = document.getElementById("edit_hyperlink_modal_container");
var span = document.getElementsByClassName("edit_hyperlink_close_symbol")[0];
span.onclick = function () {
    edit_hyperlink_modal.style.display = "none";
}

window.onclick = function (event) {
    if (event.target == edit_hyperlink_modal) {
        edit_hyperlink_modal.style.display = "none";
    }
    if (event.target == recording_panel_holder) {
        recording_panel_holder.style.display = "none";
        $('body').css('overflow', 'auto');
    }
}

var selected_html;

$('.hyperlink_btn').click(function () {
    $('#hyper_text').val(get_selected_txt());
    selected_html = saveSelection();
    edit_hyperlink_modal.style.display = "block";
    remove_link = false;
});

$('.hyperlink_btn').mousedown(function (e) {
    e.preventDefault();
});

function get_selected_txt() {
    var sel = window.getSelection();
    return (sel.toString());
}

$('#link_to_bar input').on('click', function () {
    if ($('input[name=link_type]:checked').val() == 'webpage') {
        $('#open_in_new_check').css('display', 'block');
        $('#hyperlink_test_btn').css('display', 'block');
        $('#link_address').val('http://');
    } else {
        $('#open_in_new_check').css('display', 'none');
        $('#hyperlink_test_btn').css('display', 'none');
        $('#link_address').val('');
    }
});

$('#edit_hyperlink_ok').click(function () {
    edit_hyperlink_modal.style.display = "none";
    restoreSelection(selected_html);
    if (remove_link) {
        document.execCommand('insertHTML', false, '<span>' + $('#hyper_text').val() + '</span>');
        return;
    };
    if ($('input[name=link_type]:checked').val() == 'webpage') {
        if (document.getElementById('open_in_new').checked)
            document.execCommand('insertHTML', false, '<a style="font-size:' + fontSize + 'px;" href="' + $('#link_address').val() + '" target="_blank">' + $('#hyper_text').val() + '</a>');
        else
            document.execCommand('insertHTML', false, '<a style="font-size:' + fontSize + 'px;" href="' + $('#link_address').val() + '">' + $('#hyper_text').val() + '</a>');
    } else {
        document.execCommand('insertHTML', false, '<a style="font-size:' + fontSize + 'px;" href="mailto:' + $('#link_address').val() + '">' + $('#hyper_text').val() + '</a>');
    }
});

function saveSelection() {
    if (window.getSelection) {
        sel = window.getSelection();
        if (sel.getRangeAt && sel.rangeCount) {
            var ranges = [];
            for (var i = 0, len = sel.rangeCount; i < len; ++i) {
                ranges.push(sel.getRangeAt(i));
            }
            return ranges;
        }
    } else if (document.selection && document.selection.createRange) {
        return document.selection.createRange();
    }
    return null;
}

function restoreSelection(savedSel) {
    if (savedSel) {
        if (window.getSelection) {
            sel = window.getSelection();
            sel.removeAllRanges();
            for (var i = 0, len = savedSel.length; i < len; ++i) {
                sel.addRange(savedSel[i]);
            }
        } else if (document.selection && savedSel.select) {
            savedSel.select();
        }
    }
}

$('#hyperlink_test_btn').click(function () {
    window.open($('#link_address').val(), '_blank');
});

$('#edit_hyperlink_cancel').click(function () {
    edit_hyperlink_modal.style.display = "none";
});

$('#hyperlink_remove_btn').click(function () {
    remove_link = true;
});

$('#slide_view_rec_mic_btn').click(function () {
    $('#recording_panel_holder').show();
    $('body').css('overflow', 'hidden');
});

$('#form_view_rec_mic_btn').click(function () {
    $('#recording_panel_holder').show();
    $('body').css('overflow', 'hidden');
});

$('#close_recording').click(function () {
    $('#recording_panel_holder').hide();
    $('body').css('overflow', 'auto');
});

//===================================
//
//             LAYOUT
//
//===================================

var picture_element_ratio = 0;
var video_element_ratio = 0;

var layout_applied = false;
var question_style_top;
var question_style_left;
var question_style_width;
var question_style_height;
var answer_style_top;
var answer_style_left;
var answer_style_width;
var answer_style_height;
var picture_style_top;
var picture_style_left;
var picture_style_width;
var picture_style_height;
var video_style_top;
var video_style_left;
var video_style_width;
var video_style_height;

$('.layout_panel_img_holder').click(function () {

    if (!layout_applied) {
        question_style_top = $('.slide_view_question_element').css('top');
        question_style_left = $('.slide_view_question_element').css('left');
        question_style_width = $('.slide_view_question_element').css('width');
        question_style_height = $('.slide_view_question_element').css('height');
        answer_style_top = $('.slide_view_answer_element').css('top');
        answer_style_left = $('.slide_view_answer_element').css('left');
        answer_style_width = $('.slide_view_answer_element').css('width');
        answer_style_height = $('.slide_view_answer_element').css('height');
        picture_style_top = $('.slide_view_media_element').css('top');
        picture_style_left = $('.slide_view_media_element').css('left');
        picture_style_width = $('.slide_view_media_element').css('width');
        picture_style_height = $('.slide_view_media_element').css('height');
        video_style_top = $('.slide_view_video_element').css('top');
        video_style_left = $('.slide_view_video_element').css('left');
        video_style_width = $('.slide_view_video_element').css('width');
        video_style_height = $('.slide_view_video_element').css('height');
        layout_applied = true;
    }


    var question_style = $(this).attr('data-questyle').split(' ');
    var answer_style = $(this).attr('data-anstyle').split(' ');
    var media_style = $(this).attr('data-medstyle').split(' ');
    $('.slide_view_question_element').css('top', question_style[0] + '%');
    $('.slide_view_question_element').css('left', question_style[1] + '%');
    $('.slide_view_question_element').css('width', question_style[2] + '%');
    $('.slide_view_question_element').css('height', question_style[3] + '%');

    $('.slide_view_answer_element').css('top', answer_style[0] + '%');
    $('.slide_view_answer_element').css('left', answer_style[1] + '%');
    $('.slide_view_answer_element').css('width', answer_style[2] + '%');
    $('.slide_view_answer_element').css('height', answer_style[3] + '%');

    var container_ratio = $('#quiz_background_container').width() / $('#quiz_background_container').height();
    var ratio_to_be_changed = container_ratio * media_style[2] / media_style[3];

    if ($('.slide_view_element .slide_view_media_element').find('img').eq(0).attr('src') != '#') {
        // if ($('.slide_view_element .slide_view_media_element').css('display') != 'none') {
            if (picture_element_ratio == 0)
            picture_element_ratio = $('.slide_view_element .slide_view_media_element').width() / $('.slide_view_element .slide_view_media_element').height();
        // }
        if (picture_element_ratio < ratio_to_be_changed) {
            $('.slide_view_media_element').css('top', media_style[0] + '%');
            $('.slide_view_media_element').css('height', media_style[3] + '%');
            $('.slide_view_media_element').css('width', parseInt(media_style[2]) / ratio_to_be_changed * picture_element_ratio + '%');
            $('.slide_view_media_element').css('left', parseInt(media_style[1]) - (parseInt(media_style[2]) / ratio_to_be_changed * picture_element_ratio - parseInt(media_style[2])) / 2 + '%');
        } else {
            $('.slide_view_media_element').css('left', media_style[1] + '%');
            $('.slide_view_media_element').css('width', media_style[2] + '%');
            $('.slide_view_media_element').css('height', parseInt(media_style[3]) / picture_element_ratio * ratio_to_be_changed + '%');
            $('.slide_view_media_element').css('top', parseInt(media_style[0]) - (parseInt(media_style[3]) / picture_element_ratio * ratio_to_be_changed - parseInt(media_style[3])) / 2 + '%');
        }
    }

    if ($('.slide_view_element .slide_view_video_element').find('source').eq(0).attr('src') != '#') {
        // if ($('.slide_view_element .slide_view_video_element').css('display') != 'none') {
            if (video_element_ratio == 0)
            video_element_ratio = $('.slide_view_element .slide_view_video_element ').width() / $('.slide_view_element .slide_view_video_element').height();
        // }

        if (video_element_ratio < ratio_to_be_changed) {
            $('.slide_view_video_element').css('top', media_style[0] + '%');
            // $('.slide_view_video_element').css('height', media_style[3] + '%');
            $('.slide_view_video_element').css('width', parseInt(media_style[3]) * video_element_ratio / container_ratio + '%');
            $('.slide_view_video_element').css('left', parseInt(media_style[1]) + (parseInt(media_style[2]) - parseInt(media_style[3]) * video_element_ratio / container_ratio) / 2 + '%');
        } else {
            $('.slide_view_video_element').css('left', media_style[1] + '%');
            $('.slide_view_video_element').css('width', media_style[2] + '%');
            $('.slide_view_video_element').css('top', parseInt(media_style[0]) - (parseInt(media_style[2]) / video_element_ratio * container_ratio - parseInt(media_style[3])) / 2 + '%');
            // $('.slide_view_video_element').css('height', parseInt(media_style[3]) / picture_element_ratio * ratio_to_be_changed + '%');
        }
    }
});


$('#layout_reset_btn').click(function () {
    if (layout_applied) {
        $('.slide_view_question_element').css('top', question_style_top);
        $('.slide_view_question_element').css('left', question_style_left);
        $('.slide_view_question_element').css('width', question_style_width);
        $('.slide_view_question_element').css('height', question_style_height);
        $('.slide_view_answer_element').css('top', answer_style_top);
        $('.slide_view_answer_element').css('left', answer_style_left);
        $('.slide_view_answer_element').css('width', answer_style_width);
        $('.slide_view_answer_element').css('height', answer_style_height);
        $('.slide_view_media_element').css('top', picture_style_top);
        $('.slide_view_media_element').css('left', picture_style_left);
        $('.slide_view_media_element').css('width', picture_style_width);
        $('.slide_view_media_element').css('height', picture_style_height);
        $('.slide_view_video_element').css('top', video_style_top);
        $('.slide_view_video_element').css('left', video_style_left);
        $('.slide_view_video_element').css('width', video_style_width);
        $('.slide_view_video_element').css('height', video_style_height);
    }

});


$('#layout_column_01_btn').click(function () {
    var element = $('.selected_slide_view_group').eq(0); // get selected element
    if (element.find('.choice_item').length > 0) {
        element.find('.choice_item').eq(0).parent().css('display', 'flex');
        element.find('.choice_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.choice_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.choice_item').css('flex', '0 0 100%');
    }
    if (element.find('.response_item').length > 0) {
        element.find('.response_item').eq(0).parent().css('display', 'flex');
        element.find('.response_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.response_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.response_item').css('flex', '0 0 100%');
    }
});

$('#layout_column_02_btn').click(function () {
    var element = $('.selected_slide_view_group').eq(0); // get selected element
    if (element.find('.choice_item').length > 0) {
        element.find('.choice_item').eq(0).parent().css('display', 'flex');
        element.find('.choice_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.choice_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.choice_item').css('flex', '0 0 50%');
    }
    if (element.find('.response_item').length > 0) {
        element.find('.response_item').eq(0).parent().css('display', 'flex');
        element.find('.response_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.response_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.response_item').css('flex', '0 0 50%');
    }
});

$('#layout_column_03_btn').click(function () {
    var element = $('.selected_slide_view_group').eq(0); // get selected element
    if (element.find('.choice_item').length > 0) {
        element.find('.choice_item').eq(0).parent().css('display', 'flex');
        element.find('.choice_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.choice_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.choice_item').css('flex', '0 0 33.3%');
    }
    if (element.find('.response_item').length > 0) {
        element.find('.response_item').eq(0).parent().css('display', 'flex');
        element.find('.response_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.response_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.response_item').css('flex', '0 0 33.3%');
    }
});

$('#layout_column_04_btn').click(function () {
    var element = $('.selected_slide_view_group').eq(0); // get selected element
    if (element.find('.choice_item').length > 0) {
        element.find('.choice_item').eq(0).parent().css('display', 'flex');
        element.find('.choice_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.choice_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.choice_item').css('flex', '0 0 25%');
    }
    if (element.find('.response_item').length > 0) {
        element.find('.response_item').eq(0).parent().css('display', 'flex');
        element.find('.response_item').eq(0).parent().css('flex-direction', 'row');
        element.find('.response_item').eq(0).parent().css('flex-wrap', 'wrap');
        element.find('.response_item').css('flex', '0 0 25%');
    }
});


// sel = window.getSelection();

// for(let i = 0; i < sel.rangeCount; i++) {
//  ranges[i] = sel.getRangeAt(i);
// }
// ranges[0].cloneContents()
// div=document.createElement("div");
// div.appendChild(content)
// div.innerHTML

// https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment

$('#xxxxxxx').click(function () {
    $('#yyyyyyy').trigger('click');
});

$('#design_section_preview_btn_top').click(function (e) {
    e.stopPropagation();
    $('#design_section_preview_btn_bottom').trigger('click');
});

$('#theme_select_btn_top').click(function (e) {
    e.stopPropagation();
    $('#theme_select_btn_bottom').trigger('click');
});

$('#insert_section_slide_btn_top').click(function (e) {
    e.stopPropagation();
    $('#insert_section_slide_btn_bottom').trigger('click');
});

$('#insert_section_audio_btn_top').click(function (e) {
    e.stopPropagation();
    $('#slide_view_insert_audio_btn').trigger('click');
});

$('#insert_section_question_btn_top').click(function (e) {
    e.stopPropagation();
    $('#insert_section_question_btn_bottom').trigger('click');
});

$('#slideview_home_preview_btn_top').click(function (e) {
    e.stopPropagation();
    $('#slideview_home_preview_btn_bottom').trigger('click');
});

$('#slideview_quick_styles_btn_top').click(function (e) {
    e.stopPropagation();
    $('#slideview_quick_styles_btn_bottom').trigger('click');
});

$('#slideview_arrange_btn_top').click(function (e) {
    e.stopPropagation();
    $('#slideview_arrange_btn_down').trigger('click');
});

$('#select_question_btn').click(function (e) {
    e.stopPropagation();
    $('#select_question_dropdown').trigger('click');
});

$('#formview_preview_btn').click(function (e) {
    e.stopPropagation();
    $('#formview_preview_dropdown').trigger('click');
});

$('#font_color_display_letter').mousedown(function (e) {
    e.preventDefault();
});

$('#font_color_display_letter').click(function (e) {
    e.stopPropagation();
    $('#font_picker_trigger').trigger('click');
});

function init_styling_and_layout() {
    picture_element_ratio = 0;
    video_element_ratio = 0;
    layout_applied = false;

    formatting_bold = false;
    formatting_strike = false;
    formatting_ital = false;
    formatting_underline = false;
    formatting_subscript = false;
    formatting_superscript = false;

    $('#slide_view_font_family_selector').val('Arial');
    $('#font_size_selector').val('16');
    fontSize = 16;
    changing_font_size_for_answer_element = 16;
}


// init_styling_and_layout()   when leaving current quiz, on a new quiz