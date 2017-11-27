$(document).on('click', '#cancel_achievement_edit', function(){
  var achievement_id = $('#cancel_achievement_edit').val();
  $('#edit_achievement_'+achievement_id).remove();
  $('#info_achievement_'+achievement_id).show();
});
$(document).on('click', '#cancel_achievement_new', function(){
  $('#new_achievement').remove();
  $('#btn-add-achievements').show();
});
$(document).on('click', '#cancel_user_edit', function(){
  var user_id = $('#cancel_user_edit').val();
  $('#edit_user_'+user_id).remove();
  $('#show-user').show(1000);
});
