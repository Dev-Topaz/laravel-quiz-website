$('#user_info_add_field a').click(function () {
    console.log('user_info_add_field');

    $('#user_info_table_body tr:last-child').after('<tr><th><input type="text" class="field_name" value="New field"></th><th><select name="condition" class="condition"><option value="mandatory" selected="">Mandatory</option><option value="optional">Optional</option><option value="none">Don\'t ask</option></select></th><th><select name="field_type" class="field_type"><option value="text" selected="">Text</option><option value="choice">Choice</option><option value="email">Email</option></select></th><th><input type="text" class="value" value=""></th><th><input type="text" class="variable" value="NEW_FIELD"></th><th><a onclick="{$(this).parent().parent().remove();set_flag_true();}"><i style="font-size: 18px;" class="fas fa-trash-alt"></i></a></th></tr>');
});

function toggle_user_info_dropdown(element) {
    console.log('toggle_user_info_dropdown');

    $(element).next().toggle();
}
