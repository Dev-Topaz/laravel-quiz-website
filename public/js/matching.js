$(function () {
    $(".draggable").draggable({

        start: function () {
            $(this).addClass("ui-state-highlight");
            if ($(this).attr("isdropped")) {
                $(this).parent().css({'justify-content': 'space-around'});
                $(this).attr("isdropped", false);
            }
        },

        stop: function () {
            $(this).removeClass("ui-state-highlight");

        },

        revert: true,
    });
    $(".droppable").droppable({
        classes: {
            "ui-droppable-hover": "ui-state-highlight"
        },
        drop: function (event, ui) {
            $(this).addClass("ui-state-hover");
            $(this).parent().css({'justify-content': 'center'});
            ui.draggable.attr("isdropped", true);

            swap_value(ui.draggable, $(this).next());
        }
    });
});

function swap_value(a, b) {
    tmp = a.html();
    a.html(b.html());
    b.html(tmp);
}
