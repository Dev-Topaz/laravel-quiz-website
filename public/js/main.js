$('.middle_form_bar').click(function () {
    $(this).next().toggle();
});

// $(document).on('load', function () {
console.log("loaded!!!");
// Animate loader off screen
$(".se-pre-con").fadeOut(1000);
// });

var label_prev_content = '';

$('body').on('click', '[data-editable]', function () {

    console.log("clicked");

    const $el = $(this);

    label_prev_content = $el.html();

    let $input = $('<div contenteditable="true" class="form_view_textbox_editable" style="border: 1px solid black;width: 100%;overflow-y: scroll;">' + $el.html() + '</div>');
    if ($input.html().indexOf('Type') != -1 && $input.html().indexOf('content') != -1 && $input.html().indexOf('...') != -1) {
        $input = $('<div contenteditable="true" class="form_view_textbox_editable" style="border: 1px solid black;width: 100%;overflow-y: scroll;"></div>');
    }
    // const $input = $('<input style="margin: 0 40px 0 5px;"/>').val($el.text());
    $el.replaceWith($input);

    $('div[contenteditable=true]').keydown(function (e) {
        console.log(e.keyCode);
        if ($(this).closest('.question_score').length > 0) {
            if (!((e.keyCode > 47 && e.keyCode < 58) || (e.keyCode > 95 && e.keyCode < 106) || e.keyCode == 8 || e.keyCode == 46)) e.preventDefault();
            update_slide_view_nav();
        } else {
            update_slide_view_nav();
        }
    });

    const save = function () {
        let $label = $('<label data-editable />').html($input.html());

        if ($input.html() == '') {
            if ($input.closest('.question_score').length > 0) {
                $label = $('<label data-editable />').html('0');
            } else {
                $label = $('<label data-editable />').html(label_prev_content);
            }
        }

        if ($input.closest('#select_lists').length > 0) {
            $input.prev().val($input.html());
        }
        $input.replaceWith($label);
    };

    $input.one('blur', save).focus();

});

$(function () {
    var fromIndex, toIndex;
    var fromId, toId;

    $('.listview li ul').sortable({
        start: function (event, ui) {
            fromIndex = get_order(ui.item);
            fromId = ui.item.attr('id');
        },

        stop: function (event, ui) {
            toIndex = get_order(ui.item.next());
            toId = ui.item.next().attr('id');
            console.log(fromId, toId);

            const root_url = $('meta[name=url]').attr('content');
            const token = $('meta[name=csrf-token]').attr('content');

            const exam_id = $('#exam_id').val();

            $.ajax({
                url: root_url + '/update_quiz_index',
                type: 'POST',
                data: {
                    _token: token,
                    fromIndex: fromIndex,
                    toIndex: toIndex,
                    exam_id: exam_id,
                },
                success: function (data) {

                    const element = $('#preview_item-' + fromId)[0].outerHTML;
                    $('#preview_item-' + fromId).remove();
                    $(element).insertBefore($('#preview_item-' + toId));

                    if (fromIndex > toIndex) {
                        for (let i = 0; i < $('#quiz_list li.node').length; i++) {
                            if (parseInt($('#quiz_list li.node').eq(i).attr('order')) >= toIndex && parseInt($('#quiz_list li.node').eq(i).attr('order')) < fromIndex) {
                                $('#quiz_list li.node').eq(i).attr('order', parseInt($('#quiz_list li.node').eq(i).attr('order')) + 1);
                            }
                        }
                    }

                    if (fromIndex < toIndex) {
                        for (let i = 0; i < $('#quiz_list li.node').length; i++) {
                            if (parseInt($('#quiz_list li.node').eq(i).attr('order')) <= toIndex && parseInt($('#quiz_list li.node').eq(i).attr('order')) > fromIndex) {
                                $('#quiz_list li.node').eq(i).attr('order', parseInt($('#quiz_list li.node').eq(i).attr('order')) - 1);
                            }
                        }
                    }
                    ui.item.attr('order', toIndex);
                    show_modal('success', 'Success', 'Question Index updated successfully');
                }
            }).catch((XHttpResponse) => {
                console.log(XHttpResponse);
            });
        },
    });

    function get_order(ui) {
        console.log(ui.attr('order'));
        return ui.attr('order');
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

$('body').on('click', 'div[contenteditable=true]', function () {
    $('div[contenteditable=true]').keyup(function (e) {
        update_slide_view_nav();
    });
});

function update_slide_view_nav() {
    localStorage.setItem('is_edited', 'true');

    if ($('#quiz_list .node.current').length > 0) {
        if ($('#quiz_view .slide_view_element').html() != undefined) $('#preview_item-' + $('#quiz_list .node.current').attr('id')).html($('#quiz_view .slide_view_element').html().replace('top: 50%; left: 50%; transform: translate(-50%, -50%);', '').replace('top:50%;left:50%;transform:translate(-50%, -50%);', '').replace('slide_view_hotspots_canvas', 'slide_view_hotspots_canvas-' + $('#quiz_list .node.current').attr('id')));
        $('#preview_item-' + $('#quiz_list .node.current').attr('id') + ' > div').css({
            'margin': 'auto',
            'zoom': ($('#slide_view_quiz_list').width() - 40) / parseInt($('#screen_width').val()),
        });
        if ($('#question').html() != undefined) $('#' + $('#quiz_list .node.current').attr('id') + ' .data .caption').html($('#question').html().replace(/(<([^>]+)>)/gi, ''));

        if ($('#type_id').val() == '11') {
            var slide_view_canvas = new fabric.Canvas('slide_view_hotspots_canvas-' + $('#quiz_list .node.current').attr('id'));

            var canvas_info = $('#answer_content').val();

            if (canvas_info == '@{}') return;

            var canvas_bg_url = canvas_info.split('@')[0];
            var canvas_item_info = canvas_info.split('@')[1];

            var json_bg_url = JSON.parse(canvas_bg_url);
            var json_canvas_item = JSON.parse(canvas_item_info);

            fabric.Image.fromURL(root_url + '/' + json_bg_url.background, function (img) {
                slide_view_canvas.setBackgroundImage(img, slide_view_canvas.renderAll.bind(slide_view_canvas), {
                    scaleX: fit_canvas_image(slide_view_canvas.width, slide_view_canvas.height, img.width, img.height).scaleFactor,
                    scaleY: fit_canvas_image(slide_view_canvas.width, slide_view_canvas.height, img.width, img.height).scaleFactor,
                    originX: 'left',
                    originY: 'top',
                    top: fit_canvas_image(slide_view_canvas.width, slide_view_canvas.height, img.width, img.height).top,
                    left: fit_canvas_image(slide_view_canvas.width, slide_view_canvas.height, img.width, img.height).left,
                });
            });

            if (json_canvas_item.type === 'circle') {

                slide_view_canvas.add(new fabric.Circle({
                    radius: json_canvas_item.radius,
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580',
                    originX: 'center',
                    originY: 'center',
                    top: json_canvas_item.top,
                    left: json_canvas_item.left
                }));
            }

            if (json_canvas_item.type === 'rect') {

                slide_view_canvas.add(new fabric.Rect({
                    width: json_canvas_item.width,
                    height: json_canvas_item.height,
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580',
                    top: json_canvas_item.top,
                    left: json_canvas_item.left
                }));
            }

            if (json_canvas_item.type === 'polyline') {

                slide_view_canvas.add(new fabric.Polygon(json_canvas_item.points, {
                    strokeWidth: 3,
                    stroke: '#288f02',
                    fill: '#c1fc8580'
                }));
            }
        }
    }
}
