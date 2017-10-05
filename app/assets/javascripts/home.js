$('#decouvrir-btn').click(function(){
  var targetPosition = $('#home-content').offset().top;
  $('html, body').animate({ scrollTop: targetPosition }, 'slow');
});
