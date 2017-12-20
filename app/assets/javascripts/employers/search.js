$(document).ready(function(){
  $("input#search").keyup(function (){
      $.get($("#verified_search").attr("action"), $("#verified_search").serialize(), null, "script");
      return false;
  });
});
$(document).ready(function() {
  $('.js-example-basic-multiple').select2();
});

$(document).ready(function() {
  $('#reset-appointment').on('click',function(){
   $('#new_appointment')[0].reset();
  });
});
