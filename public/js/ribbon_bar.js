var clipboard_str = '';

console.log('ribbon_bar');

// $('#target_element').val('');

// template function
$('#xxxxx').click(function () {
    console.log('xxx');
});


//=========================================
//
//          Copy Cut Paste
//
//=========================================

// Copy btn click function
$('#slide_view_copy_btn').click(function () {
    console.log('copy click');
    clipboard_str = get_selected_str();
});

$('#slide_view_copy_btn').mousedown(function (e) {
    e.preventDefault(); // prevent the textarea to loose focus!
});


// cut function
$('#slide_view_cut_btn').click(function () {
    console.log('slide_view_cut_btn');
    clipboard_str = get_selected_str();
    console.log('clipboard_str', clipboard_str);
    delete_selected_str();
});

$('#slide_view_cut_btn').mousedown(function (e) {
    e.preventDefault(); // prevent the textarea to loose focus!
});


// Paste btn click function
$('#slide_view_paste_btn').click(function () {
    console.log('slide_view_paste_btn');
    paste_str(clipboard_str);
    // window.getSelection().removeAllRanges();
    // sel.focusOffset
    setCurrentCursorPosition(get_cursor_pos_supposed_to_be(clipboard_str));
});

$('#slide_view_paste_btn').mousedown(function (e) {
    e.preventDefault(); // prevent the textarea to loose focus!
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
    console.log(str);
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
    console.log('setCurrentCursorPosition 10');
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

$('#slide_view_font_family_selector').change(function () {
    // console.log('slide_view_font_family_selector changed');
    changeFont($(this).val());
});

$('#font_size_selector').change(function () {
    // console.log('font_size_selector changed');
    changeFont_size($(this).val());
});

var changing_font_size = parseInt($('#font_size_selector').val());

$('#font_size_bigger_btn').click(function () {
    // console.log('font_size_bigger_btn');
    // changing_font_size = parseInt($('#font_size_selector').val());
    changing_font_size += 2;
    changeFont_size(changing_font_size);
});

$('#font_size_smaller_btn').click(function () {
    // console.log('font_size_smaller_btn');
    // changing_font_size = parseInt($('#font_size_selector').val());
    changing_font_size -= 2;
    changeFont_size(changing_font_size);
});

$('#font_style_clear_btn').click(function () {
    console.log('font_size_bigger_btn');
    // changing_font_size = parseInt($('#font_size_selector').val());
    clear_formatting();
});

var formatting_bold = false;

$('#slide_view_font_bold_btn').click(function () {
    console.log('bold clicked');
    formatting_bold = !formatting_bold;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_bold(formatting_bold);
});

var formatting_ital = false;

$('#slide_view_font_ital_btn').click(function () {
    console.log('ital clicked');

    formatting_ital = !formatting_ital;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_ital(formatting_ital);
});

var formatting_underline = false;

$('#slide_view_font_underline_btn').click(function () {
    console.log('slide_view_font_underline_btn clicked');

    formatting_underline = !formatting_underline;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_underline(formatting_underline);
});

var formatting_subscript = false;

$('#slide_view_font_subscription_btn').click(function () {
    console.log('slide_view_font_subscription_btn clicked');

    formatting_subscript = !formatting_subscript;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_subscript(formatting_subscript);
});

var formatting_superscript = false;

$('#slide_view_font_superscription_btn').click(function () {
    console.log('slide_view_font_superscription_btn clicked');

    formatting_superscript = !formatting_superscript;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_superscript(formatting_superscript);
});

$('#font_picker_trigger').click(function () {
    console.log('font_picker_trigger clicked');
    $('#font_color_picker').trigger('click');
});

$('#font_picker_trigger').mousedown(function (e) {
    e.preventDefault(); // prevent the textarea to loose focus!
});

$('#font_color_picker').change(function () {
    //console.log('color changed', $(this).val());
    $("#font_color_display_letter").css('border-color', $(this).val());
    change_font_color($(this).val());
});



function change_font_color(color) {
    console.log('change_font_color', color);
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
    console.log('toggle_subscript');
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
    console.log('toggle_subscript');
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

function toggle_underline(formatting_underline) {
    console.log('toggle_ital');
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
    console.log('toggle_ital');
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

var para_bullet = false;

$('#slide_view_paragraph_style_bullet_btn').click(function () {
    console.log('slide_view_paragraph_style_bullet_btn');
    para_bullet = !para_bullet;
    create_bullet(para_bullet);
});

function create_bullet(para_bullet) {
    console.log('create_bullet');
    el = document.getElementsByClassName('slide_view_question_element')[0];
    console.log('==>>', el);
    nodes = el.childNodes;
    console.log('nodes==>>', nodes);
    for (i = 0; i < nodes.length; i++) {
        console.log('==>', nodes[i].innerText);
        nodes[i].innerText = i + 1 + '. ' + nodes[i].innerText;
    }

    if (para_bullet) {

    } else {

    }
}
