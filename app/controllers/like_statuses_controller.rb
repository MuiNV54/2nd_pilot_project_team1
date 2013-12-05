class LikeStatusesController < ApplicationController
  def new
  end
  def create
    like_status = LikeStatus.new user_id: params[:user_id],
      status_id: params[:status_id]
    if like_status.save

    end
    redirect_to :back
  end

  def destroy
    LikeStatus.find(params[:id]).destroy
    redirect_to :back
  end
end