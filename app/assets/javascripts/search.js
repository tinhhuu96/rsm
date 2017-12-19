$(document).ready(function(){
  $("input#search").keyup(function (){
      $.get($("#verified_search").attr("action"), $("#verified_search").serialize(), null, "script");
      return false;
  });
});
