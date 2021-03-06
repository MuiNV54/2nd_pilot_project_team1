class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    if params[:comment]
      @comment = Comment.new params.require(:comment).permit :content, :status_id
      status = Status.find params[:status_id]
      user = status.status_host
      if @comment.save
        @comment.update_attributes user_id: current_user.id, status_id: params[:status_id]
        Activity.comment_status! current_user, user
      end
    end
    redirect_to :back
  end

  def edit
    @status = Status.find params[:status_id]
    @comment = Comment.find params[:id]
  end

  def update
    @user = User.find params[:user_id]
    @status = @user.statuses.find params[:status_id]
    @comment = @status.comments.find params[:id]
    if @comment.update_attributes content: params[:comment][:content]
      redirect_to :back
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
end