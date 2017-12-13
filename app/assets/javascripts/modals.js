$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();
});

$("#close-modal-add-loan").click(function(){
  $('#modal-add-loan').modal('close');
})
