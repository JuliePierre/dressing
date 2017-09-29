Dropzone.autoDiscover = false;

$(document).ready(function() {
  $('select').material_select();

  var myDropzone = new Dropzone(".dropzone");

  Dropzone.options.myDropzone = {
    paramName: "file"
  };
  myDropzone.on("success", function(file, json) {
    console.log("success");
    var jsonUrl = json["file"]["url"];
    $("#vide_dressing_photo").val(jsonUrl);
  });
});

