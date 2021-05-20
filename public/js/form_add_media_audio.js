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
    $('#slide_view_container').append('<div class="slide_view_media_element slide_view_group" style="z-index: 3;display: none;"><img src="#" alt="slide_view_media" style="width: 100%;height: 100%;"></div>');
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
                    $('.slide_view_media_element').show();
                    $('#media_element').val($('.slide_view_media_element')[0].outerHTML);
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

/*
* ************ Add & Upload Video **************
* */

$('#form_view_add_video').click(function () {
    $('#form_view_input_video_element').trigger('click');
});

$('#form_view_input_video_element').change(function () {
    // $('#form_view_upload_video').submit();
    var CSRF_TOKEN = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
    var files = $('#form_view_input_video_element')[0].files;

    if (files.length > 0) {
        var fd = new FormData();

        // Append data
        fd.append('file', files[0]);
        fd.append('_token', CSRF_TOKEN);

        // Hide alert
        $('#responseMsg').hide();

        // AJAX request
        $.ajax({
            url: `/upload_video`,
            method: 'post',
            data: fd,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (response) {


                if (response.success == 1) { // Uploaded successfully

                    console.log(response.filepath);
                    $('#video').val(response.filepath);
                    $('#video_properties_video source').attr('src', $('#video').val()).appendTo($('#video_properties_video source').parent());
                    $('#form_view_add_picture').hide();
                    $('#form_view_add_video').hide();
                    $('#form_view_video_element').show();
                } else if (response.success == 2) { // File not uploaded

                    // Response message
                    $('#responseMsg').removeClass("alert-success");
                    $('#responseMsg').addClass("alert-danger");
                    $('#responseMsg').html(response.message);
                    $('#responseMsg').show();
                } else {
                    // Display Error
                    $('#err_file').text(response.error);
                    $('#err_file').removeClass('d-none');
                    $('#err_file').addClass('d-block');
                }
            },
            error: function (response) {
                console.log("error : " + JSON.stringify(response));
            }
        });
    } else {
        alert("Please select a file.");
    }

});

function show_video_properties() {
    $('.slide_option').hide();
    $('.video_properties').show();
    // $('#video_properties_video source').attr('src', $('#video').val()).appendTo($('#video_properties_video source').parent());

}

function close_video_properties() {
    $('.slide_option').show();
    $('.video_properties').hide();
}

function change_video() {
    $('#form_view_input_video_element').trigger('click');
}

/*
* *************** Add Audio
* */
$('#form_view_add_audio').click(function () {
    $('#form_view_input_audio_element').trigger('click');
});

$('#form_view_input_audio_element').change(function () {
    console.log('changed');
    var CSRF_TOKEN = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
    var files = $('#form_view_input_audio_element')[0].files;

    if (files.length > 0) {
        var fd = new FormData();

        // Append data
        fd.append('file', files[0]);
        fd.append('_token', CSRF_TOKEN);

        // Hide alert
        $('#responseMsg').hide();

        // AJAX request
        $.ajax({
            url: `/upload_audio`,
            method: 'post',
            data: fd,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (response) {


                if (response.success == 1) { // Uploaded successfully

                    console.log(response);
                    $('#form_view_add_audio').hide();
                    $('#form_view_audio_mark').show();
                    $('#audio').val(response.filepath);
                } else if (response.success == 2) { // File not uploaded

                    // Response message
                    $('#responseMsg').removeClass("alert-success");
                    $('#responseMsg').addClass("alert-danger");
                    $('#responseMsg').html(response.message);
                    $('#responseMsg').show();
                } else {
                    // Display Error
                    $('#err_file').text(response.error);
                    $('#err_file').removeClass('d-none');
                    $('#err_file').addClass('d-block');
                }
            },
            error: function (response) {
                console.log("error : " + JSON.stringify(response));
            }
        });
    } else {
        alert("Please select a file.");
    }

});

$('#form_view_audio_mark').click(function () {
    $('.audio_properties').show();
    $('.slide_option').hide();
    $('#audio_properties source').attr('src', $('#audio').val()).appendTo($('#audio_properties source').parent());
});
