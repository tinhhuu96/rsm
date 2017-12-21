$(document).on('click', '#check-toggle', function(){
    if ($("#check-toggle").is(':checked')){
      $('#open').show(1000);
    }
    else{
      $('#open').hide(1000);
    };
  });
$(document).ready(function(){
  if ($("#check-toggle").is(':checked')){
      $('#open').show(1000);
    }
});
