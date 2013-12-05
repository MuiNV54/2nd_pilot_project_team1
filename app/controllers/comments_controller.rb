class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new params.require(:comment).permit :content, :status_id
    if @comment.save
      @comment.update_attributes user_id: current_user.id, status_id: params[:status_id]
    end
    redirect_to :back
  end

  def edit
    @status = Status.find params[:status_id]
    @comment = Comment.find params[:id]
  end

  def update
    @user = User.find params[:user_id]
    @status = Status.find params[:status_id]
    @comment = Comment.find params[:id]
    if @comment.update_attributes content: params[:comment][:content]
      redirect_to user_path @user
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
      @comment.update_attributes(user_id: current_user.id, status_id: params[:status_id])
    end
    redirect_to :back
  end
end