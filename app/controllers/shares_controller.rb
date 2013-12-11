class SharesController < ApplicationController
	def new
	end

	def create
		share_status = Share.new user_id: params[:user_id],
      status_id: params[:status_id]
    if share_status.save
    end
    redirect_to user_path(current_user)
	end

	def destroy
    Share.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end
end