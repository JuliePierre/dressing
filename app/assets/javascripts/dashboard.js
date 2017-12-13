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
  $( "#link-to-ajouter" ).on( "click", function() {
    $( "#ajouter-link a" ).trigger( "click" );
  });
  $( "#link-to-mesprets" ).on( "click", function() {
    $( "#mesprets-link a" ).trigger( "click" );
  });
  // $( "#monreseau-link" ).on( "click", function() {
  //   $('#mesamis-link a').trigger('click')
  // });
});
