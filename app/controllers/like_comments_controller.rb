class LikeCommentsController < ApplicationController
  def new
  end

  def like_or_unlike
    if params[:user_id] &&params[:comment_id]
      like_comment = LikeComment
        .find_by_user_id_and_comment_id params[:user_id], params[:comment_id]
      if like_comment
        like_comment.destroy
        message = "Like"
      else
        new_like = LikeComment.new user_id: params[:user_id], 
          comment_id: params[:comment_id]
        new_like.save
        message = "Unlike"
      end
    end
    number = Comment.find(params[:comment_id]).like_comments.count
    render json: {message: message, number: number}
  end
end