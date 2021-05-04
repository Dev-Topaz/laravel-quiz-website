$(function () {

    show_cursor();

    $('.textarea_dropdown').click(function () {
        if ($(this).html() === '') {
            $(this).html('<span class="select_cursor first_span" style="padding-left: 1px;"></span>');
        }
    });

    $('.textarea_dropdown').keypress(function () {
        const keyCode = event.keyCode;
        switch (keyCode) {
            case 32:
                break;
            case 13:
                $('.select_cursor').after('<br><span class="line_first_span" style="padding-left: 1px;" onclick="{cursor(this);}"></span>');
                cursor($('.select_cursor').next().next());
                break;

            default:
                $('.select_cursor').after('<span onclick="{cursor(this);}">' + String.fromCharCode(keyCode) + '</span>');
                cursor($('.select_cursor').next());
        }
    });

    $('.textarea_dropdown').keydown(function () {
        const keyCode = event.keyCode;
        console.log(keyCode);
        switch (keyCode) {
            case 32:
                $('.select_cursor').after('<span style="padding-left: 3px;" onclick="{cursor(this);}"></span>');
                cursor($('.select_cursor').next());
                break;
            case 8:
                if ($('.select_cursor').hasClass('line_first_span')) {
                    cursor($('.select_cursor').prev().prev());
                    $('.select_cursor').next().remove();
                    $('.select_cursor').next().remove();
                } else if (!$('.select_cursor').hasClass('first_span')) {
                    cursor($('.select_cursor').prev());
                    $('.select_cursor').next().remove();
                }
                break;
            case 46:
                if ($('.select_cursor').next().next().hasClass('line_first_span')) {
                    $('.select_cursor').next().remove();
                    $('.select_cursor').next().remove();
                } else if (!$('.select_cursor').next().hasClass('first_span')) $('.select_cursor').next().remove();
                break;
            case 37:
                if ($('.select_cursor').prev().length > 0) {
                    if ($('.select_cursor').hasClass('line_first_span')) cursor($('.select_cursor').prev().prev());
                    else cursor($('.select_cursor').prev());
                }
                break;
            case 39:
                if ($('.select_cursor').next().length > 0) {
                    if ($('.select_cursor').next().next().hasClass('line_first_span')) {
                        cursor($('.select_cursor').next().next());
                    } else cursor($('.select_cursor').next());
                }
                break;
        }
    });
});

function insert_dropdown() {
    $('#textarea_dropdown').focus();
    $('.select_cursor').after('<span onclick="{cursor(this);}"><select name="cars" id="cars"><option value="volvo">Volvo</option><option value="saab">Saab</option><option value="mercedes">Mercedes</option><option value="audi">Audi</option></select></span>');
    cursor($('.select_cursor').next());
    $('#textarea_dropdown').focus();
}

function cursor(element) {
    $('.textarea_dropdown .select_cursor').removeClass('cursor');
    $('.textarea_dropdown .select_cursor').removeClass('select_cursor');
    $(element).addClass('select_cursor');
}

function show_cursor() {
    setInterval(function () {
        if ($('.textarea_dropdown .select_cursor').length > 0) {
            $('.textarea_dropdown .select_cursor').toggleClass('cursor');
        }
    }, 500);
}
