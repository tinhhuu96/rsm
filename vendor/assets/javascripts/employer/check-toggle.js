$(document).on('click', '#myonoffswitch', function(){
    if ($("#myonoffswitch").is(':checked')){
      $('#open').show(1000);
      $('.first_show').hide();
    }
    else{
      $('#open').hide(1000);
      $('.first_show').show();
    };
  });
$(document).ready(function(){
  if ($("#myonoffswitch").is(':checked')){
      $('#open').show(1000);
      $('.first_show').hide();
    }

});
