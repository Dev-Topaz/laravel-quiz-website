$('.from_files').click(function () {
    $('#hotspots_only_from_files_image').trigger('click');
});

var canvas = this.__canvas = new fabric.Canvas('hotspots_canvas');

// fabric.Object.prototype.transparentCorners = false;
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
        $('#hotspots_image').attr('src', e.target.result);
        $('#hotspots_one_column').hide();
        $('#hotspots_two_columns').show();
    }

    reader.readAsDataURL(this.files[0]);

});


var line, isDown;

function drawcle() {

    var circle, isDown, origX, origY, isDraw = false;
    removeEvents();
    canvas.on('mouse:down', function (o) {
        if (isDraw) return;
        isDown = true;
        var pointer = canvas.getPointer(o.e);
        origX = pointer.x;
        origY = pointer.y;
        circle = new fabric.Circle({
            left: pointer.x,
            top: pointer.y,
            radius: 1,
            strokeWidth: 3,
            stroke: '#288f02',
            fill: '#c1fc8580',
            originX: 'center',
            originY: 'center',
            transparentCorners: false
        });
        canvas.add(circle);
    });

    canvas.on('mouse:move', function (o) {
        if (!isDown || isDraw) return;
        var pointer = canvas.getPointer(o.e);
        circle.set({
            radius: Math.abs(origX - pointer.x)
        });
        canvas.renderAll();
    });

    canvas.on('mouse:up', function (o) {
        isDown = false;
        isDraw = true;
    });

}

function drawrec() {
    var rect, isDown, origX, origY, isDraw = false;
    removeEvents();
    canvas.on('mouse:down', function (o) {
        if (isDraw) return;
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
            strokeWidth: 3,
            stroke: '#288f02',
            fill: '#c1fc8580',
            // transparentCorners: false
        });
        canvas.add(rect);
    });

    canvas.on('mouse:move', function (o) {
        if (!isDown || isDraw) return;
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
        isDraw = true;
        console.log(canvas);
    });
}

function removeEvents() {
    canvas.off('mouse:down');
    canvas.off('mouse:up');
    canvas.off('mouse:move');
}

function deleteCanvas() {
    canvas.getActiveObject().remove();
}

/*********************************************
 *    *******      Polygen        *******     *
 **********************************************/
var roof = null;
var roofPoints = [];
var lines = [];
var lineCounter = 0;
var drawingObject = {};
drawingObject.type = "";
drawingObject.background = "";
drawingObject.border = "";

function Point(x, y) {
    this.x = x;
    this.y = y;
}


function drawpoly() {
    if (drawingObject.type == "roof") {
        drawingObject.type = "";
        lines.forEach(function (value, index, ar) {
            canvas.remove(value);
        });
        //canvas.remove(lines[lineCounter - 1]);
        roof = makeRoof(roofPoints);
        canvas.add(roof);
        canvas.renderAll();
    } else {
        drawingObject.type = "roof"; // roof type
    }
}


// canvas Drawing
var x = 0;
var y = 0;

fabric.util.addListener(window, 'dblclick', function () {
    drawingObject.type = "";
    lines.forEach(function (value, index, ar) {
        canvas.remove(value);
    });
    //canvas.remove(lines[lineCounter - 1]);
    roof = makeRoof(roofPoints);
    canvas.add(roof);
    canvas.renderAll();

    console.log("double click");
    //clear arrays
    roofPoints = [];
    lines = [];
    lineCounter = 0;

});

canvas.on('mouse:down', function (options) {
    console.log('down');
    if (drawingObject.type == "roof") {
        canvas.selection = false;
        setStartingPoint(options);
        console.log("----------------");
        console.log(x, y);// set x,y
        roofPoints.push(new Point(x, y));
        var points = [x, y, x, y];
        lines.push(new fabric.Line(points, {
            strokeWidth: 3,
            selectable: false,
            stroke: '#288f02',
            originX: 'center',
            originY: 'center'
        }));
        // }).setOriginX(x).setOriginY(y));
        canvas.add(lines[lineCounter]);
        lineCounter++;
        canvas.on('mouse:up', function (options) {
            console.log('up');
            canvas.selection = true;
        });
    }
});
canvas.on('mouse:move', function (options) {
    if (lines[0] !== null && lines[0] !== undefined && drawingObject.type == "roof") {
        setStartingPoint(options);
        lines[lineCounter - 1].set({
            x2: x,
            y2: y
        });
        canvas.renderAll();
    }
});

function setStartingPoint(options) {
    var offset = $('#hotspots_canvas').offset();
    x = options.e.pageX - offset.left;
    y = options.e.pageY - offset.top;
    console.log(x, y);
}

function makeRoof(roofPoints) {

    var left = findLeftPaddingForRoof(roofPoints);
    var top = findTopPaddingForRoof(roofPoints);
    roofPoints.push(new Point(roofPoints[0].x, roofPoints[0].y))
    var roof = new fabric.Polyline(roofPoints, {
        fill: '#c1fc8580',
        stroke: '#288f02',
        strokeWidth: 3,
    });
    roof.set({

        left: left,
        top: top,

    });


    return roof;
}

function findTopPaddingForRoof(roofPoints) {
    var result = 999999;
    for (var f = 0; f < lineCounter; f++) {
        if (roofPoints[f].y < result) {
            result = roofPoints[f].y;
        }
    }
    return Math.abs(result);
}

function findLeftPaddingForRoof(roofPoints) {
    var result = 999999;
    for (var i = 0; i < lineCounter; i++) {
        if (roofPoints[i].x < result) {
            result = roofPoints[i].x;
        }
    }
    return Math.abs(result);
}
