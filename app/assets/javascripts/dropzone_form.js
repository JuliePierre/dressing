Dropzone.autoDiscover = false;

$(function() {
  if (document.getElementById('my-dropzone')) {
    var myDropzone = new Dropzone("#my-dropzone", {
      paramName: "file",
      capture: "camera",
      acceptedFiles: 'image/*',
      previewsContainer: "#dropzonePreview",
      clickable:'#dropzonePreview',
      resizeWidth: "400",
      resizeHeight: "250",
      resizeMethod: "crop",
      thumbnailWidth: "400",
      thumbnailHeight: "250",
    });

    myDropzone.on("success", function(file, json) {
      console.log("success");
      var jsonUrl = json["file"]["url"];
      $("#vide_dressing_photo").val(jsonUrl);
      // $('#remove-pictures').removeClass('hidden');
    });

   $('#dropzonePreview').click(function() {
      $('#dropzonePreview .message-container').addClass('hidden');
    });
    // $('#remove-pictures').click(function(){
    //   myDropzone.removeAllFiles();
    // });
  };

  // item
  if (document.getElementById('pictures-dropzone')) {
    var myDropzone = new Dropzone("#pictures-dropzone", {
      paramName: "file",
      capture: "camera",
      acceptedFiles: 'image/*',
      previewsContainer: "#itemDropzonePreview",
      uploadMultiple: "true",
      resizeWidth: "1000",
      resizeHeight: "1400",
      resizeMethod: "crop",
      thumbnailWidth: "250",
      thumbnailHeight: "350",
    });
    myDropzone.on("success", function(file, json) {
      var jsonUrl = json["file"]["url"];
      var urls = $("#vide_dressing_item_photos").val() + " " + jsonUrl
      $("#vide_dressing_item_photos").val(urls);
      // $('#remove-pictures').removeClass('hidden');
    });

   // $('#dropzonePreview').click(function() {
   //    $('#dropzonePreview .message-container').addClass('hidden');
   //  });
  };
});

