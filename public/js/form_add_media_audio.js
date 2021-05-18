$('#form_view_add_picture').click(function () {
    $('#form_view_input_media_element').trigger('click');
});

function change_media_pic() {
    $('#form_view_input_media_element').trigger('click');
}

function delete_media_pic() {
    $('.slide_option').show();
    $('.picture_properties').hide();
    $('#form_view_add_picture').show();
    $('#form_view_add_video').show();
    $('#form_view_media_element').hide();
    $('#media').val('');
    $('.slide_view_media_element').remove();
    $('#slide_view_container').append('<div class="slide_view_media_element slide_view_group"><img src="#" alt="slide_view_media"></div>');
}

function show_pic_properties() {
    $('.slide_option').hide();
    $('.picture_properties').show();
    $('#picture_properties_image img').attr('src', $('#form_view_media_element').attr('src'));
}

function close_pic_properties() {
    $('.slide_option').show();
    $('.picture_properties').hide();
}

$('#form_view_input_media_element').change(function () {

    var root_url = $('meta[name=url]').attr('content');

    let reader = new FileReader();

    reader.onload = (e) => {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        let formData = new FormData();
        formData.append('image', e.target.result);
        formData.append('quiz_id', $("#quiz_id").val());

        $.ajax({
            type: 'POST',
            url: `/hotspots_image_upload`,
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    console.log(response);
                    $('#media').val(root_url + '/' + response);
                    $('.slide_view_media_element img').attr('src', root_url + '/' + response);
                    $('#media_element').val('');
                    console.log('Image has been uploaded successfully');
                }
            },
            error: function (response) {
                console.log(response);
                // $('#image-input-error').text(response.responseJSON.errors.file);
            }
        });

        $('#form_view_media_element').attr('src', e.target.result);
        $('#picture_properties_image img').attr('src', e.target.result);
        $('#form_view_add_picture').hide();
        $('#form_view_add_video').hide();
        $('#form_view_media_element').show();
    }

    reader.readAsDataURL(this.files[0]);

});

/*
*          Quiz background Image
* */

$('#format_bg_btn').click(function () {
    $('#select_background_img').trigger('click');
});

$('#select_background_img').change(function () {

    var root_url = $('meta[name=url]').attr('content');

    let reader = new FileReader();

    reader.onload = (e) => {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        let formData = new FormData();
        formData.append('image', e.target.result);
        formData.append('quiz_id', $("#quiz_id").val());

        $.ajax({
            type: 'POST',
            url: `/hotspots_image_upload`,
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                if (response) {
                    console.log(response);
                    $('#quiz_background_container').css('background-image', 'url("' + root_url + '/' + response + '")');
                    $('#background_img').val('url("' + root_url + '/' + response + '")');
                    console.log('Image has been uploaded successfully');
                }
            },
            error: function (response) {
                console.log(response);
                // $('#image-input-error').text(response.responseJSON.errors.file);
            }
        });

    }

    reader.readAsDataURL(this.files[0]);

});
