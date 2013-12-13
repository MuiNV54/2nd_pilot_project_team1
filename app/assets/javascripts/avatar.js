$(function(){
  $("#btn_change_avatar").change(function(){
    if (this.files && this.files[0]){
      var reader = new FileReader();
      reader.onload = function(e) {
        $("#avatar")
          .attr('src', e.target.result)
          .width("160px")
          .height("160px");
        };
      reader.readAsDataURL(this.files[0]);
      $(".edit_user").submit();
    }
  });
  $("#avatar").click(function () {
  $("#btn_change_avatar").trigger('click');
  });
});