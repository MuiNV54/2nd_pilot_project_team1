class UsersController < ApplicationController
  def show
  	@user = User.find params[:id]
  	@status = Status.new
  	@statuses = @user.statuses
  end
end