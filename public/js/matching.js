// $(function () {
//     $(".draggable").draggable({
//
//         start: function () {
//             $(this).addClass("ui-state-highlight");
//             if ($(this).attr("isdropped")) {
//                 $(this).parent().css({'justify-content': 'space-around'});
//                 $(this).attr("isdropped", false);
//             }
//         },
//
//         stop: function () {
//             $(this).removeClass("ui-state-highlight");
//
//         },
//
//         revert: true,
//     });
//     $(".droppable").droppable({
//         classes: {
//             "ui-droppable-hover": "ui-state-highlight"
//         },
//         drop: function (event, ui) {
//             $(this).addClass("ui-state-hover");
//             $(this).parent().css({'justify-content': 'center'});
//             ui.draggable.attr("isdropped", true);
//
//             swap_value(ui.draggable, $(this).next());
//         }
//     });
// });

$(function () {
    $('#matching_list').sortable();
});

$('#add_matching').click(function () {
    console.log($(this));
    let element;

    element = '<tr class="matching_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="matching_item_label" data-editable>Type item content...</label></td><td></td><td><label class="matching_label" data-editable>Type match content...</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>';

    $('#matching_list').append(element);

});

// function swap_value(a, b) {
//     tmp = a.html();
//     a.html(b.html());
//     b.html(tmp);
// }
