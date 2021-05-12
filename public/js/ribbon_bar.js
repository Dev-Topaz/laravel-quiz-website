var clipboard_str='';

console.log('ribbon_bar');

// $('#target_element').val('');

// template function
$('#xxxxx').click(function () {
    console.log('xxx');
});


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
    // set_cursor_position();
});

$('#slide_view_paste_btn').mousedown(function (e) {
    e.preventDefault(); // prevent the textarea to loose focus!
});

//  https://raw.githubusercontent.com/Sophie627/flutter-Enriched-Digital-Writer-re-build/master/lib/widget/texteditor/divelement.dart

function get_selected_str() {
    var sel = window.getSelection(); // Gets selection
    if (sel.rangeCount) {
        return (sel.toString());
    }
    return ('');
}

function delete_selected_str() {
    var sel = window.getSelection(); // Gets selection
    if (sel.rangeCount) {
        // Creates a new element, and insert the selected text with the chosen font inside
        var range = sel.getRangeAt(0);
        range.deleteContents(); // Deletes selected text…
    }
}

function paste_str(str) {
    console.log(str);
    var sel = window.getSelection(); // Gets selection
    if (sel.rangeCount) {
        // Creates a new element, and insert the selected text with the chosen font inside
        var e = document.createElement('span');

        e.innerHTML = str;

        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents(); // Deletes selected text…
        range.insertNode(e); // … and inserts the new element at its place
    }
}

function set_cursor_position() {
    var el = $('.slide_view_question_element').eq(0);
    var range = document.createRange();
    var sel = window.getSelection();
    range.setStart(el.childNodes[0], 2);
    range.collapse(true);
    sel.removeAllRanges();
    sel.addRange(range);
    el.focus();
}


function changeFont(font) {
    var sel = window.getSelection(); // Gets selection
    if (sel.rangeCount) {
        // Creates a new element, and insert the selected text with the chosen font inside
        var e = document.createElement('span');
        e.style = 'font-family:' + font.value + ';';
        e.innerHTML = sel.toString();

        // https://developer.mozilla.org/en-US/docs/Web/API/Selection/getRangeAt
        var range = sel.getRangeAt(0);
        range.deleteContents(); // Deletes selected text…
        range.insertNode(e); // … and inserts the new element at its place
    }
}
