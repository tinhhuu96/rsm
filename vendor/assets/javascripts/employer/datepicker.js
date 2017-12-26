$(document).ready(function() {
  $('#user_birthday').datepicker({
    format: 'yyyy/mm/dd'
  });
});
$(document).ready(function(){
  $('.datepick').datepicker( {
    format: 'dd-mm-yyyy',
    startView: 'months'
  });
});

$(document).ready(function(){
  function runningFormatter(value, row, index) {
    return index;
  };
  document.getElementById("style-2").addEventListener("scroll",function(){
    var scroll = this.scrollTop - 20;
    var translate = "translate(0,"+scroll+"px)";
    this.querySelector("thead").style.transform = translate;
  });
});
