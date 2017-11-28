$(document).ready(function(){
    $('#bannerSelect').on('change',function(){
      var selectedFile = event.target.files[0];
      var reader = new FileReader();

      var imgtag = document.getElementById('banner_img');
      imgtag.title = selectedFile.name;

      reader.onload = function(event) {
        imgtag.src = event.target.result;
      };

      reader.readAsDataURL(selectedFile);
    });

    $('#logoSelect').on('change',function(){
      var selectedFile = event.target.files[0];
      var reader = new FileReader();

      var imgtag = document.getElementById('logo_img');
      imgtag.title = selectedFile.name;

      reader.onload = function(event) {
        imgtag.src = event.target.result;
      };

      reader.readAsDataURL(selectedFile);
    });
});
