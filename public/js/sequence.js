$(function () {
    $('tbody#sequence_list').sortable({'cancel': 'div[contenteditable=true]',
        'sort': function () {
            update_slide_view_nav();
        }
    });
});
$('#add_sequence').click(function () {
    let element;

    element = '<tr class="sequence_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>Type content...</label><td></td><td><a onclick="{$(this).parent().parent().remove();save_select_data();update_slide_view_nav();}"><i class="fas fa-trash-alt"></i></a></td></tr>';

    $('tbody#sequence_list').append(element);

    update_slide_view_nav();
});
