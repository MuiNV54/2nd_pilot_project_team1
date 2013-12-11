class LikeStatusesController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def like_or_unlike
    if params[:user_id] && params[:status_id]
      like_status = LikeStatus
        .find_by_user_id_and_status_id params[:user_id],params[:status_id]
      if like_status
        like_status.destroy
        message = "Like"
      else
        new_like = LikeStatus.new user_id: params[:user_id], 
          status_id: params[:status_id]
        new_like.save
        message = "Unlike"
      end
    end
    num = Status.find(params[:status_id]).like_statuses.count
    render json: {message: message, num: num}
  end
end