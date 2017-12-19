$(document).ready(function(){
  $('ul.tabs').tabs();
});
$('.request-preview-card').click(function(){
  $('.received-messages').hide();
  $('.request-messages').hide();
  $('.request-preview-card').removeClass('active');
  $(this).addClass('active');
  var target = "#" + $(this).data('target');
  $(target).show();
})
