class SharesController < ApplicationController
	def new
	end

	def create
		share_status = Share.new user_id: params[:user_id],
      status_id: params[:status_id]
    if share_status.save
    end
    redirect_to :back
	end

	def destroy
    Share.find(params[:id]).destroy
    redirect_to :back
  end
end