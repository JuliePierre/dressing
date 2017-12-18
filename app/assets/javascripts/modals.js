$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();
});

$(".close-modal").click(function(){
  var target = "." + $(this).data('target');
  $(target).modal('close');
});
