$('.from_files').click(function () {
    $('#hotspots_only_from_files_image').trigger('click');
});

$('#hotspots_only_from_files_image').change(function () {


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
                    alert('Image has been uploaded successfully');
                }
            },
            error: function (response) {
                console.log(response);
                // $('#image-input-error').text(response.responseJSON.errors.file);
            }
        });

        $('#hotspots_image').attr('src', e.target.result);
        $('#hotspots_one_column').hide();
        $('#hotspots_two_columns').show();
    }

    reader.readAsDataURL(this.files[0]);

});
