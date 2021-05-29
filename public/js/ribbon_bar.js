var remove_link = false;
var clipboard_str = '';


// $('#target_element').val();

// template function
$('#xxxxx').click(function () {
});
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

$('#slide_view_font_family_selector').change(function () {
    // changeFont($(this).val());
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('fontName', false, $(this).val());
});

$('#font_size_selector').change(function () {
    changeFont_size($(this).val());
    //     document.execCommand('styleWithCSS', false, true);
    //     document.execCommand('fontName', false, 7);

    //     var execFontSize = function (size, unit) {
    //     var spanString = $('<span/>', {
    //         'text': document.getSelection()
    //     }).css('font-size', size + unit).prop('outerHTML');

    //     document.execCommand('insertHTML', false, spanString);
    // };
});

var changing_font_size = parseInt($('#font_size_selector').val());

$('#font_size_bigger_btn').click(function () {

    changing_font_size += 2;
    changeFont_size(changing_font_size);
    // document.execCommand('styleWithCSS', false, true);
    // document.execCommand('increaseFontSize');
});

$('#font_size_smaller_btn').click(function () {

    changing_font_size -= 2;
    changeFont_size(changing_font_size);

    // document.execCommand('styleWithCSS', false, true);
    // document.execCommand('decreaseFontSize');
});

$('#font_style_clear_btn').click(function () {

    clear_formatting();
});

var formatting_bold = false;

$('.font_bold_btn').click(function () {
    formatting_bold = !formatting_bold;
    // toggle_bold(formatting_bold);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('bold');
});

var formatting_strike = false;

$('#slide_view_font_strike_btn').click(function () {
    formatting_strike = !formatting_strike;
    // toggle_strike(formatting_strike);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('strikeThrough');
});

var formatting_ital = false;

$('.font_ital_btn').click(function () {

    formatting_ital = !formatting_ital;

    // toggle_ital(formatting_ital);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('italic');
});

var formatting_underline = false;

$('.font_underline_btn').click(function () {

    formatting_underline = !formatting_underline;

    // toggle_underline(formatting_underline);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('underline');
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

$("#office_color_picker").on("change.color", function (event, color) {
    // event.preventDefault();
    // change_font_color(color);
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('foreColor', false, color);
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
});

$('#paragraph_align_center').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'center');
});

$('#paragraph_align_right').click(function () {
    var element = $('.selected_slide_view_group'); // get selected element
    element.css('text-align', 'right');
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
    element.css('left', '0');
});

$('#align_right').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_width = parent_el.width();

    var elements = $('.selected_slide_view_group'); // get selected element
    var el_num = elements.length;
    for (let i = 0; i < el_num; i++) {
        var element = elements.eq(i);
        element.css('left', parent_width - element.outerWidth());
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
    element.css('top', '0');

});

$('#align_bottom').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_height = parent_el.height();
    var elements = $('.selected_slide_view_group'); // get selected element
    var el_num = elements.length;
    for (let i = 0; i < el_num; i++) {
        var element = elements.eq(i);
        element.css('top', parent_height - element.outerHeight());
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
    cancel_hyperlink();
}

window.onclick = function (event) {
    if (event.target == edit_hyperlink_modal) {
        edit_hyperlink_modal.style.display = "none";
        cancel_hyperlink();
    }
    if (event.target == recording_panel_holder) {
        recording_panel_holder.style.display = "none";
        $('body').css('overflow', 'auto');
    }
}

$('.hyperlink_btn').click(function () {
    $('#hyper_text').val(get_selected_txt());
    get_ready_for_hyperlink();
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

function get_ready_for_hyperlink() {
    var sel = window.getSelection();
    if (sel.rangeCount) {
        var e = document.createElement('span');
        // e.style = 'font-family:' + font.value + ';';
        e.className = "hyperlink";
        e.innerHTML = sel.toString();
        var range = sel.getRangeAt(0);
        range.deleteContents();
        range.insertNode(e);
    }
}

$('#edit_hyperlink_modal_container input').on('change', function () {
    if ($('input[name=link_type]:checked').val() == 'webpage') {
        $('#open_in_new_check').css('display', 'block');
        $('#hyperlink_test_btn').css('display', 'block');
        // $('#link_address').val('http://');
    } else {
        $('#open_in_new_check').css('display', 'none');
        $('#hyperlink_test_btn').css('display', 'none');
        $('#link_address').val('');
    }

});

$('#edit_hyperlink_ok').click(function () {
    edit_hyperlink_modal.style.display = "none";
    if (remove_link) return;

    if ($('input[name=link_type]:checked').val() == 'webpage') {
        if (document.getElementById('open_in_new').checked)
            $('.slide_view_question_element').eq(0).find('span.hyperlink').html('<a target="_blank" href="' + $('#link_address').val() + '">' + $('#hyper_text').val() + '</a>');
        else
            $('.slide_view_question_element').eq(0).find('span.hyperlink').html('<a href="' + $('#link_address').val() + '">' + $('#hyper_text').val() + '</a>');
    } else {
        $('.slide_view_question_element').eq(0).find('span.hyperlink').html('<a href="mailto:' + $('#link_address').val() + '">' + $('#hyper_text').val() + '</a>');
    }
});

$('#hyperlink_test_btn').click(function () {
    window.open($('#link_address').val(), '_blank');
});

$('#edit_hyperlink_cancel').click(function () {
    cancel_hyperlink();
    edit_hyperlink_modal.style.display = "none";
});

$('#hyperlink_remove_btn').click(function () {
    cancel_hyperlink();
});

function cancel_hyperlink() {
    remove_link = true;
    $('.slide_view_question_element').eq(0).find('span.hyperlink').html($('#hyper_text').val());
    $('.slide_view_question_element').eq(0).find('span.hyperlink').removeClass('hyperlink');
}

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

var picture_element_ratio = 1;
var video_element_ratio = 1;

var applied_layout = false;
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

    if (!applied_layout) {
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
        applied_layout = true;
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

    if ($('.slide_view_media_element').find('img').eq(0).attr('src') != '#') {
        if ($('.slide_view_media_element').css('display') != 'none') {
            picture_element_ratio = $('.slide_view_media_element').width() / $('.slide_view_media_element').height();
        }
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

    if ($('.slide_view_video_element').find('source').eq(0).attr('src') != '#') {
        if ($('.slide_view_video_element').css('display') != 'none') {
            video_element_ratio = $('.slide_view_video_element ').width() / $('.slide_view_video_element').height();
        }

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

    if (applied_layout) {
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
