$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();
});

$("#modal-add-loan .close-modal-add-loan").click(function(){
  $('#modal-add-loan').modal('close');
});

$("#modal-send-request .close-modal-add-loan").click(function(){
  $('#modal-send-request').modal('close');
});
