$('#validate-button').click(function() {
  $('#add-pictures-container').removeClass('hidden');
  var targetPosition = $('#add-pictures-container').offset().top;
  $('html, body').animate({ scrollTop: targetPosition }, 'slow');

});
