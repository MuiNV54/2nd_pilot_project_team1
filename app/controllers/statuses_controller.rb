class StatusesController < ApplicationController
  def new
  	@status = Status.new
  end

  def create
  	@status = Status.new params.require(:status).permit :content
  	if @status.save
  		@status.update_attribute(:user_id, current_user.id)
  	end
  	redirect_to user_path(current_user)
  end
end