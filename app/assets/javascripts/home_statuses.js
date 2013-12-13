$(function() {
  $(".like_status_btn").click(function(){
    status_id = $(this).data().status;
    $.ajax({
    type: "GET",
    url: "/like_statuses/like_or_unlike",
    dataType: "json",
    data: {user_id: $(this).data().id,status_id: $(this).data().status},
    error: function(data){
    },
    success: function(data){
      $(".btn_" + status_id).html(data.message);
      $(".btn_" + status_id).siblings("span.num").html(data.num);
    }
  })
  });
});

$(function() {
  $(".like_comment_btn").click(function(){
    comment_id = $(this).data().comment;
    $.ajax({
    type: "GET",
    url: "/like_comments/like_or_unlike",
    dataType: "json",
    data: {user_id: $(this).data().id,comment_id: $(this).data().comment},
    error: function(data){
    },
    success: function(data){
      $(".btn_" + comment_id).html(data.message);
      $(".btn_" + comment_id).siblings("span.number").html(data.number);
    }
  })
  });
});

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