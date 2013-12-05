class LikeCommentsController < ApplicationController
  def new
  end

  def create
    like_comment = LikeComment.new user_id: params[:user_id],
      comment_id: params[:comment_id]
    if like_comment.save
    end
    redirect_to :back
  end

  def destroy
    LikeComment.find(params[:id]).destroy
    redirect_to :back
  end
end