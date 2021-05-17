$('.from_files').click(function () {
    $('#hotspots_only_from_files_image').trigger('click');
});

var canvas = new fabric.Canvas('hotspots_canvas', {
    selection: false
});

canvas.backgroundColor = '#34AD39';
canvas.renderAll();

$('#hotspots_only_from_files_image').change(function () {

    canvas.setBackgroundColor('', canvas.renderAll.bind(canvas));
    canvas.setBackgroundImage(0, canvas.renderAll.bind(canvas));

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
                    console.log('Image has been uploaded successfully');
                }
            },
            error: function (response) {
                console.log(response);
                // $('#image-input-error').text(response.responseJSON.errors.file);
            }
        });

        fabric.Image.fromURL(e.target.result, function (img) {
            canvas.setBackgroundImage(img, canvas.renderAll.bind(canvas), {
                scaleX: canvas.width / img.width,
                scaleY: canvas.height / img.height
            });
        });
        // $('#hotspots_image').attr('src', e.target.result);
        $('#hotspots_one_column').hide();
        $('#hotspots_two_columns').show();
    }

    reader.readAsDataURL(this.files[0]);

});


var line, isDown;

function drawcle() {

    var circle, isDown, origX, origY;
    removeEvents();
    canvas.on('mouse:down', function (o) {
        isDown = true;
        var pointer = canvas.getPointer(o.e);
        origX = pointer.x;
        origY = pointer.y;
        circle = new fabric.Circle({
            left: pointer.x,
            top: pointer.y,
            radius: 1,
            strokeWidth: 2,
            stroke: 'red',
            fill: 'White',
            selectable: false,
            originX: 'center',
            originY: 'center'
        });
        canvas.add(circle);
    });

    canvas.on('mouse:move', function (o) {
        if (!isDown) return;
        var pointer = canvas.getPointer(o.e);
        circle.set({
            radius: Math.abs(origX - pointer.x)
        });
        canvas.renderAll();
    });

    canvas.on('mouse:up', function (o) {
        isDown = false;
    });

}

function drawrec() {
    var rect, isDown, origX, origY;
    removeEvents();
    canvas.on('mouse:down', function (o) {
        isDown = true;
        var pointer = canvas.getPointer(o.e);
        origX = pointer.x;
        origY = pointer.y;
        var pointer = canvas.getPointer(o.e);
        rect = new fabric.Rect({
            left: origX,
            top: origY,
            originX: 'left',
            originY: 'top',
            width: pointer.x - origX,
            height: pointer.y - origY,
            angle: 0,
            fill: 'rgba(255,0,0,0.5)',
            transparentCorners: false
        });
        canvas.add(rect);
    });

    canvas.on('mouse:move', function (o) {
        if (!isDown) return;
        var pointer = canvas.getPointer(o.e);

        if (origX > pointer.x) {
            rect.set({
                left: Math.abs(pointer.x)
            });
        }
        if (origY > pointer.y) {
            rect.set({
                top: Math.abs(pointer.y)
            });
        }

        rect.set({
            width: Math.abs(origX - pointer.x)
        });
        rect.set({
            height: Math.abs(origY - pointer.y)
        });


        canvas.renderAll();
    });

    canvas.on('mouse:up', function (o) {
        isDown = false;
    });
}

function removeEvents() {
    canvas.off('mouse:down');
    canvas.off('mouse:up');
    canvas.off('mouse:move');
}
