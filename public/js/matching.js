$(function () {
    // $('#matching_list').sortable({'cancel': 'div[contenteditable=true]'});
});

$('#add_matching').click(function () {
    console.log($(this));
    let element;

    element = '<tr class="matching_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="matching_item_label" data-editable>Type item content...</label></td><td></td><td><label class="matching_label" data-editable>Type match content...</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();update_slide_view_nav();}"><i class="fas fa-trash-alt"></i></a></td></tr>';

    $('#matching_list').append(element);
    update_slide_view_nav();

});
