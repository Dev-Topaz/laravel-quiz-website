$(function () {
    $('tbody#sequence_list').sortable();
});
$('#add_sequence').click(function () {
    let element;

    element = '<tr class="sequence_item"><td><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><label class="sequence_label" data-editable>Type content...</label><td></td><td><a onclick="{$(this).parent().parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></td></tr>';

    $('tbody#sequence_list').append(element);

});
