$('#filtering form label').click(function(event){
  var id = "#" + $(this).attr("for");
  if ($(id).prop('checked') == true) {
    $(id).prop('checked', false);
  } else {
    $(id).prop('checked', "checked");
  }
  $('#filter-btn').trigger('click');
});
