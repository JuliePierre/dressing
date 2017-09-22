$('#add-card-picture-link').click(function() {
  $('#vide_dressing_photo').trigger('click');
  if ($('.attachinary_container input').val() != null) {
    $('#add-card-picture-link').addClass('hidden');
  };
});
