class UsersController < ApplicationController
  def show
  	@user = User.find params[:id]
  	@status = Status.new
  	@statuses = @user.statuses
  	@user_friendship = current_user.friendships
  	@user_friend = @user_friendship.find_by friend_id: @user
  end
end