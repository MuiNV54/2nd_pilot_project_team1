$(function(){
  $("#image_new").change(function(){
    if (this.files && this.files[0]){
      var reader = new FileReader();
      reader.onload = function(e) {
        $("#image")
          .attr('src', e.target.result)
          .width(160)
          .height(160);
        };
      reader.readAsDataURL(this.files[0]);
      $("#new_image").submit();
    }
  });
  $("#image").click(function () {

  $("#image_new").trigger('click');
  });
});