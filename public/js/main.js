$('.middle_form_bar').click(function () {
    $(this).next().toggle();
});

// $(document).on('load', function () {
    console.log("loaded!!!");
    // Animate loader off screen
    $(".se-pre-con").fadeOut(1000);
// });

$('body').on('click', '[data-editable]', function () {

    console.log("clicked");

    const $el = $(this);

    const $input = $('<div contenteditable="true" class="form_view_textbox_editable" style="border: 1px solid black;width: 100%;overflow-y: scroll;">' + $el.html() + '</div>');
    // const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith($input);

    const save = function () {
        const $label = $('<label data-editable />').html($input.html());
        if ($input.closest('#select_lists').length > 0) {
            $input.prev().val($input.html());
        }
        $input.replaceWith($label);
    };

    $input.one('blur', save).focus();

});

$(function () {
    var fromIndex, toIndex;
    $('.listview li ul').sortable({
        start: function (event, ui) {
            fromIndex = get_order(ui.item[0]);
        },

        stop: function (event, ui) {
            toIndex = get_order(ui.item[0]);

            const root_url = $('meta[name=url]').attr('content');
            const token = $('meta[name=csrf-token]').attr('content');

            $.ajax({
                url: root_url + '/update_quiz_index',
                type: 'POST',
                data: {
                    _token: token,
                    fromIndex: fromIndex,
                    toIndex: toIndex,
                },
                success: function (data) {
                    alert('Quiz Index updated successfully');
                }
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
            });
        },
    });

    function get_order(ui) {
        const parentNode = ui.closest('.node-group');
        return $(parentNode).find('li').index(ui);
    }
});

function show_preload() {
    $('.se-pre-con').show();
    $('.se-pre-con').addClass('se-pre-con-show');
}

function hide_preload() {
    $('.se-pre-con').hide();
    $('.se-pre-con').removeClass('se-pre-con-show');
}
