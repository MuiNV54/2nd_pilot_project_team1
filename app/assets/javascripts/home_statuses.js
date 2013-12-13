function like_or_unlike_status(user_id, status_id,btn){
  $.ajax({
    type: "GET",
    url: "/like_statuses/like_or_unlike",
    data: {user_id: user_id,status_id: status_id},
    error: function(data){
    },
    success: function(data){
      btn.innerText = data["message"];
      btn.nextElementSibling.innerText = data["num"];
    }
  })
}
function like_or_unlike_comment(user_id, comment_id, btn){
  $.ajax({
    type: "GET",
    url: "/like_comments/like_or_unlike",
    data: {user_id: user_id,comment_id:comment_id},
    error: function(data){
      alert("Something went wrong");
    },
    success: function(data){
      btn.innerText = data["message"];
      btn.nextElementSibling.innerText = data["number"];
    }
  })
}
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (10+o.scrollHeight)+"px";
}
$(".comment_status").on("keydown", function(e){

  if(e.keyCode ==13)
  {
    // $(".new_comment").submit();
  var form = this.parentNode.parentNode;
  $(form).submit();
  }
});
$(".edit-comment-status").on("keydown", function(e){

  if(e.keyCode ==13)
  {
    // $(".new_comment").submit();
    var form = this.parentNode
    $(form).submit();
  }
});

$("a.non-redirect").click(function(event){
    event.preventDefault();
});

$('.edit-status-btn').click(function() {
  $(this).parent().prev().find('.status-content').hide();
  $(this).parent().hide();
  $(this).parent().next('.edit-status-wrap').show();
});

$('.edit_comment_btn').click(function() {
  $(this).parent().prev().find('.status-comment').hide();
  $(this).parent().hide();
  $(this).parent().next('.edit_comment_wrap').show();
});
$('#comment_content').keydown(function(e) {
    if (e.keyCode == 13) {
        $('#new_comment').submit();
    }
});
$('textarea').ckeditor({language: 'en'});