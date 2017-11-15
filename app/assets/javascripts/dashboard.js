$(document).ready(function(){
  $( "#link-to-monprofil" ).on( "click", function() {
    $( "#monprofil-link a" ).trigger( "click" );
  });
  $( "#link-to-monreseau" ).on( "click", function() {
    $( "#monreseau-link a" ).trigger( "click" );
  });
  $( "#link-to-mondressing" ).on( "click", function() {
    $( "#mondressing-link a" ).trigger( "click" );
  });
});
