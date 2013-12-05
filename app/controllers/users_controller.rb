class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find params[:id]
    @statuses = @user.statuses
  	@status = Status.new
  	@group  = Group.new
  	@user_friendship = current_user.friendships
  	@user_friend = @user_friendship.find_by friend_id: @user
    @comment = Comment.new
  end
end