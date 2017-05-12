$('#validate-ceremony').click(function() {
  var ceremony = $('#ceremony-choice .select-wrapper li.selected span').text();
  $('#outfit_ceremony').val(ceremony);
  $('#new_ceremony input.btn').attr("disabled", "disabled");
});
