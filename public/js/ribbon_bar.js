var remove_link = false;
var clipboard_str = '';

console.log('ribbon_bar');

// $('#target_element').val();

// template function
$('#xxxxx').click(function () {
    console.log('xxxxx');
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
    console.log('copy click');
    clipboard_str = get_selected_str();
});

$('.copy_btn').mousedown(function (e) {
    e.preventDefault();
});


// cut function
$('.cut_btn').click(function () {
    console.log('cut_btn');
    clipboard_str = get_selected_str();
    console.log('clipboard_str', clipboard_str);
    delete_selected_str();
});

$('.cut_btn').mousedown(function (e) {
    e.preventDefault();
});


// Paste btn click function
$('.paste_btn').click(function () {
    console.log('paste_btn');
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

$('.font_bold_btn').click(function () {
    console.log('bold clicked');
    formatting_bold = !formatting_bold;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_bold(formatting_bold);
});

var formatting_strike = false;

$('#slide_view_font_strike_btn').click(function () {
    console.log('slide_view_font_strike_btn clicked');
    formatting_strike = !formatting_strike;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_strike(formatting_strike);
});

var formatting_ital = false;

$('.font_ital_btn').click(function () {
    console.log('ital clicked');

    formatting_ital = !formatting_ital;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_ital(formatting_ital);
});

var formatting_underline = false;

$('.font_underline_btn').click(function () {
    console.log('slide_view_font_underline_btn clicked');

    formatting_underline = !formatting_underline;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_underline(formatting_underline);
});

var formatting_subscript = false;

$('.font_subscription_btn').click(function () {
    console.log('font_subscription_btn clicked');

    formatting_subscript = !formatting_subscript;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_subscript(formatting_subscript);
});

var formatting_superscript = false;

$('.font_superscription_btn').click(function () {
    console.log('font_superscription_btn clicked');

    formatting_superscript = !formatting_superscript;
    // changing_font_size = parseInt($('#font_size_selector').val());
    toggle_superscript(formatting_superscript);
});

$('#font_picker_trigger').click(function () {
    console.log('font_picker_trigger clicked');
    // $('#font_color_picker').trigger('click');
});

$('#font_picker_trigger').mousedown(function (e) {
    e.preventDefault();
});

// $('#font_color_picker').change(function () {
//     //console.log('color changed', $(this).val());
//     $("#font_color_display_letter").css('border-color', $(this).val());
//     change_font_color($(this).val());
// });

$('#office_color_picker').colorpicker({
    color: '#ffffff',
    defaultPalette: 'theme'
});

$('#office_color_picker').mousedown(function (e) {
    e.preventDefault();
});

$("#office_color_picker").on("change.color", function (event, color) {
    // event.preventDefault();
    console.log(color);
    change_font_color(color);
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


function toggle_strike(formatting_strike) {
    console.log('toggle_ital');
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

var para_numbering = false;

$('.numbering_btn').click(function () {
    console.log('numbering_btn');
    para_numbering = !para_numbering;
    create_numbering(para_numbering);
});

function create_numbering(para_numbering) {
    console.log('create_numbering');
    el = document.getElementsByClassName('slide_view_question_element')[0];

    if (para_numbering) {
        $('.slide_view_question_element').eq(0).find('span.buuuuullet').remove();

        console.log('==>>', el);
        nodes = el.childNodes;
        console.log('nodes==>>', nodes);
        for (i = 0; i < nodes.length; i++) {
            console.log('==>', nodes[i].innerText);
            nodes[i].innerHTML = '<span class="nuuumbering">' + (i + 1) + '. ' + '</span>' + ' ' + nodes[i].innerText;
        }
    } else {
        console.log('have to remove numbering');
        // document.getElementsByClassName('nuuumbering').remove();
        $('.slide_view_question_element').eq(0).find('span.nuuumbering').remove();
    }
}

var para_bullet = false;

$('.bullet_btn').click(function () {
    console.log('bullet_btn');
    para_bullet = !para_bullet;
    create_bullet(para_bullet);
});

function create_bullet(para_bullet) {
    console.log('create_bullet');
    el = document.getElementsByClassName('slide_view_question_element')[0];

    if (para_bullet) {
        $('.slide_view_question_element').eq(0).find('span.nuuumbering').remove();
        console.log('==>>', el);
        nodes = el.childNodes;
        console.log('nodes==>>', nodes);
        for (i = 0; i < nodes.length; i++) {
            console.log('==>', nodes[i].innerText);
            nodes[i].innerHTML = '<span class="buuuuullet">&bull;</span>' + ' ' + nodes[i].innerText;
        }
    } else {
        console.log('have to remove bullet');
        // document.getElementsByClassName('buuuuullet').remove();
        $('.slide_view_question_element').eq(0).find('span.buuuuullet').remove();
    }
}

$('.slide_view_question_element').keydown(function (event) {
    console.log(event.keycode);
})

$('#paragraph_align_left').click(function () {
    $('.slide_view_question_element').css('text-align', 'left');
});

$('#paragraph_align_center').click(function () {
    $('.slide_view_question_element').css('text-align', 'center');
});

$('#paragraph_align_right').click(function () {
    $('.slide_view_question_element').css('text-align', 'right');
});

$('#paragraph_align_justify').click(function () {
    $('.slide_view_question_element').css('text-align', 'justify');
});

$('#paragraph_line_spacing_100').click(function () {
    $('.slide_view_question_element').css('line-height', '1');
});

$('#paragraph_line_spacing_115').click(function () {
    $('.slide_view_question_element').css('line-height', '1.15');
});

$('#paragraph_line_spacing_150').click(function () {
    $('.slide_view_question_element').css('line-height', '1.5');
});

$('#paragraph_line_spacing_200').click(function () {
    $('.slide_view_question_element').css('line-height', '2');
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
//     console.log('slide_view_paragraph_style_decrease_indent_btn');
//     decrease_indent();
// });
$('.decrease_indent').click(function () {
    console.log('.decrease_indent');
    decrease_indent();
});

$('.decrease_indent').mousedown(function (e) {
    e.preventDefault();
});

$('.increase_indent').click(function () {
    console.log('increase_indent');
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
        while (!(e.parentElement.classList.contains('slide_view_question_element'))) {
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
        while (!(e.parentElement.classList.contains('slide_view_question_element'))) {
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


$('#rotate_right').click(function () {
    console.log('rotate_right');
    var element = $('.' + $('#target_element').val()).eq(0); // get selected element
    if (element.attr('rotate') == undefined || element.attr('rotate') == '0') {
        element.attr('rotate', '90');
        element.css('transform', 'rotate(90deg)');
        return;
    }
    if (element.attr('rotate') == '90') {
        element.attr('rotate', '180');
        element.css('transform', 'rotate(180deg)');
        return;
    }
    if (element.attr('rotate') == '180') {
        element.attr('rotate', '270');
        element.css('transform', 'rotate(270deg)');
        return;
    }
    if (element.attr('rotate') == '270') {
        element.attr('rotate', '0');
        element.css('transform', 'rotate(0deg)');
        return;
    }
});

$('#rotate_left').click(function () {
    console.log('rotate_left');
    var element = $('.' + $('#target_element').val()).eq(0);
    if (element.attr('rotate') == undefined || element.attr('rotate') == '0') {
        element.attr('rotate', '270');
        element.css('transform', 'rotate(270deg)');
        return;
    }
    if (element.attr('rotate') == '270') {
        element.attr('rotate', '180');
        element.css('transform', 'rotate(180deg)');
        return;
    }
    if (element.attr('rotate') == '180') {
        element.attr('rotate', '90');
        element.css('transform', 'rotate(90deg)');
        return;
    }
    if (element.attr('rotate') == '90') {
        element.attr('rotate', '0');
        element.css('transform', 'rotate(0deg)');
        return;
    }
});



$('#align_right').click(function () {
    console.log('align_right');
    $('.slide_view_group').css('left', 'unset');
    $('.slide_view_group').css('right', '0');
});

$('#align_left').click(function () {
    console.log('align_left');
    $('.slide_view_group').css('right', 'unset');
    $('.slide_view_group').css('left', '0');
});

$('#align_center').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_width = parent_el.width();
    console.log('align_center');
    ele_count = $('.slide_view_group').length;
    for (let i = 0; i < ele_count; i++) {
        element = $('.slide_view_group').eq(i);
        element.css('left', (parent_width - element.width()) / 2 + 'px');
    }
});

$('#align_top').click(function () {
    console.log('align_top');
    $('.slide_view_group').css('bottom', 'unset');
    $('.slide_view_group').css('top', '0');
});

$('#align_bottom').click(function () {
    console.log('align_bottom');
    $('.slide_view_group').css('top', 'unset');
    $('.slide_view_group').css('bottom', '0');
});

$('#align_middle').click(function () {
    var parent_el = $('#slide_view_container');
    var parent_height = parent_el.height();
    console.log('align_middle');
    ele_count = $('.slide_view_group').length;
    for (let i = 0; i < ele_count; i++) {
        element = $('.slide_view_group').eq(i);
        element.css('top', (parent_height - element.height()) / 2 + 'px');
    }
});

$('#distribute_vertically').click(function () {
    console.log('distribute_vertically');
    var height_sum = 0;
    ele_count = $('.slide_view_group').length;
    for (let i = 0; i < ele_count; i++) {
        height_sum += $('.slide_view_group').eq(i).height();
    }

    var gap = ($('#slide_view_container').height() - height_sum) / (ele_count + 1);
    for (let i = 0; i < ele_count; i++) {
        var height_to_set_sum = 0;
        for (let j = 0; j < i; j++) {
            height_to_set_sum += $('.slide_view_group').eq(j).height();
        }
        $('.slide_view_group').eq(i).css('top', height_to_set_sum + gap *(i+1) + 'px');
    }
});

$('#distribute_horizontally').click(function () {
    console.log('distribute_horizontally');
    var width_sum = 0;
    ele_count = $('.slide_view_group').length;
    for (let i = 0; i < ele_count; i++) {
        width_sum += $('.slide_view_group').eq(i).width();
    }
    var gap = ($('#slide_view_container').width() - width_sum) / (ele_count + 1);
    for (let i = 0; i < ele_count; i++) {
        var width_to_set_sum = 0;
        for (let j = 0; j < i; j++) {
            width_to_set_sum += $('.slide_view_group').eq(j).width();
        }
        $('.slide_view_group').eq(i).css('left', width_to_set_sum + gap *(i+1) + 'px');
    }
});

$('.quick_style_sample').click(function () {

    var element = $('.' + $('#target_element').val()).eq(0); // get selected element
    // var element = $('.slide_view_question_element').eq(0);
    element.css('border-color', $(this).css('border-color'));
    element.css('color', $(this).css('color'));
    element.css('background-image', $(this).css('background-image'));
    element.css('box-shadow', $(this).css('box-shadow'));
    if ($(this).css('background').indexOf('repeating-conic-gradient(rgb') == -1) {
        element.css('background', $(this).css('background'));
    } else {
        element.css('background', 'rgba' + $(this).css('background').split('repeating-conic-gradient(rgb')[1].split(') 0deg,')[0] + ', 0.7)');
    }
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
    var element = $('.' + $('#target_element').val()).eq(0); // get selected element

    element.css('background', color);
});

$("#shape_outline_color_picker").on("change.color", function (event, color) {
    var element = $('.' + $('#target_element').val()).eq(0); // get selected element

    element.css('border-color', color);
});


//========================================================
//
//               Design => Themes
//
//========================================================


$('.design_themes_panels').click(function () {
    console.log('design_themes_panels');
    console.log($(this).css('font-family'));
    console.log($(this).css('color'));
    console.log($(this).css('background-image'));
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

$('#slide_view_picture_import_btn').click(function () {
    console.log('slide_view_picture_import_btn');
    $('#slide_view_picture_file_selector').trigger('click');
});

$('#slide_view_picture_file_selector').change(function () {
    console.log('Slide View Picture File selected => ', $(this).val());
});

$('#form_view_picture_btn').click(function () {
    console.log('form_view_picture_btn');
    $('#form_view_picture_selector').trigger('click');
});

$('#form_view_picture_selector').change(function () {
    console.log('Fomr View Picture File selected => ', $(this).val());
});

$('#form_view_video_file_btn').click(function () {
    console.log('form_view_video_file_btn');
    $('#form_view_video_file_selector').trigger('click');
});

$('#form_view_video_file_selector').change(function () {
    console.log('Form View Video File selected => ', $(this).val());
});

$('#slide_view_video_file_btn').click(function () {
    console.log('slide_view_video_file_btn');
    $('#slide_view_video_file_selector').trigger('click');
});

$('#slide_view_video_file_selector').change(function () {
    console.log('Slide View Video File selected => ', $(this).val());
});

$('#slide_view_insert_audio_btn').click(function () {
    console.log('slide_view_insert_audio_btn');
    $('#slide_view_audio_selector').trigger('click');
});

$('#slide_view_audio_selector').change(function () {
    console.log('Slide View Audio File selected => ', $(this).val());
});

$('#form_view_import_audio_file_btn').click(function () {
    console.log('form_view_import_audio_file_btn');
    $('#form_view_audio_selector').trigger('click');
});

$('#form_view_audio_selector').change(function () {
    console.log('Form View Audio File selected => ', $(this).val());
});



$('#layout_reset_btn').click(function () {
    console.log('test====');
    var sel = window.getSelection()
    let range = new Range();
    var content = sel.cloneContents();
    console.log(content);
});


//================================
//
//          Modal
//
//================================

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
}

$('.hyperlink_btn').click(function () {
    console.log('hyperlink_btn');
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
        console.log($('#link_address').val());
        console.log($('#hyper_text').val());
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

// sel = window.getSelection();

// for(let i = 0; i < sel.rangeCount; i++) {
//  ranges[i] = sel.getRangeAt(i);
// }
// ranges[0].cloneContents()
// div=document.createElement("div");
// div.appendChild(content)
// div.innerHTML


// https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment
