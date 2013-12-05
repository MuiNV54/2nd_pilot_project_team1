class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new params.require(:comment).permit :content, :status_id
    if @comment.save
      @comment.update_attributes(user_id: current_user.id, status_id: params[:status_id])
    end
    redirect_to :back
  end
end