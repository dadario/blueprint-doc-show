$(document).ready(function() {
  $('#exibir').on('click', function() {
    $('#show-bar').attr('src', '/doc?url=' + $('#url').val());
  });

});
