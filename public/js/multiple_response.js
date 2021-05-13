function get_response_item_id() {
    const length = $('.response_item').length;

    let id = 1;

    if (length > 0) {
        id = 0;

        for (let i = 0; i < length; i++) {
            const inputId = parseInt($('.response_item input').eq(i).attr('id'));
            if (inputId > id) id = inputId + 1;
        }
    }

    return id;
}

$('#add_response').click(function () {

    const id = get_response_item_id();

    const element = $('<tr class="response_item"><td><input type="checkbox" id="' + id + '" name="answer" value="' + id + '" style="padding-right: 10px;"></td><td><label class="response_label" data-editable for="' + id + '">Type content ...</label></td><td></td><td><a onclick="{$(this).parent().parent().remove();}"><i class="fas fa-trash-alt"></i></a></td></tr>');
    $('tbody#response_list').append(element);
});
