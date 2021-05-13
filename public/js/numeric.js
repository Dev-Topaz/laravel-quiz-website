function get_select_item_id() {
    const length = $('.select_item').length;

    let id = 1;

    if (length > 0) {
        id = 0;
        for (let i = 0; i < length; i++) {
            if (parseInt($('.select_item select:nth-child(1)').eq(i).attr('id')) > id) {
                id = parseInt($('.select_item select:nth-child(1)').eq(i).attr('id')) + 1;
            }
        }
    }
    console.log("id", id);
    return id;
}

$('#add_select').change(function () {

    if (this.value !== '+') {
        const id = get_select_item_id();

        let element;

        if (this.value === '<<') {
            element = $('<tr><td><div class="select_item" style="display: flex;padding: 5px 0;"><label for="' + id + '">Value is: </label><select onchange="{select_change(this);}" name="' + id + '" id="' + id + '" style="max-width: 160px;"><option value="==">Equal to</option><option value="<<">Between</option><option value=">">Greater than</option><option value=">=">Greater than or equal to</option><option value="<">Less than</option><option value="<=">Less than or equal to</option><option value="!=">Not equal to</option></select><div style="display: flex;"><input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;"><span>and</span><input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;"></div></div></td><td><a onclick="{$(this).parent().parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></td></tr>');
        } else {
            element = $('<tr><td><div class="select_item" style="display: flex;padding: 5px 0;"><label for="' + id + '">Value is: </label><select onchange="{select_change(this);}" name="' + id + '" id="' + id + '" style="max-width: 160px;"><option value="==">Equal to</option><option value="<<">Between</option><option value=">">Greater than</option><option value=">=">Greater than or equal to</option><option value="<">Less than</option><option value="<=">Less than or equal to</option><option value="!=">Not equal to</option></select><div style="display: flex;"><input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;"></div></div></td><td><a onclick="{$(this).parent().parent().remove();save_select_data();}"><i class="fas fa-trash-alt"></i></a></td></tr>');
        }
        $('tbody#numeric_list').append(element);
        $('select#' + id).val(this.value);
    }

    $(this).val('+');
    save_select_data();
});

function select_change(select) {
    console.log(select.value);
    if (select.value === '<<') {
        $(select).next().html('<input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;"><span>and</span><input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;">');
    } else {
        $(select).next().html('<input type="number" value="0" onchange="{save_select_data();}" style="max-width: 100px;">');
    }
    save_select_data();
}

function save_select_data() {
    const length = $('.select_item').length;

    let select_answer_array = '';

    for (let i = 0; i < length; i++) {
        let value = $('#numeric_list tr:nth-child(' + (i + 1) + ') select').val();
        select_answer_array += value + ';';
        if (value === '<<') {
            select_answer_array += $('#numeric_list tr:nth-child(' + (i + 1) + ') input:nth-child(1)').val() + ';' + $('#numeric_list tr:nth-child(' + (i + 1) + ') input:nth-child(1)').next().next().val() + '@';
        } else {
            select_answer_array += $('#numeric_list tr:nth-child(' + (i + 1) + ') input:nth-child(1)').val() + ';' + '@';
        }
    }

    console.log(select_answer_array);
    $('input#select_answer').val(select_answer_array);
}
