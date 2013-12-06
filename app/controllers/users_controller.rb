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

  def edit
  end

  def update
    if params[:flag]
      current_user.get_permit params[:flag]
    else
      current_user.update_attributes user_params
    end
    redirect_to user_path current_user
  end

  def profile
    @user = User.find params[:id]
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :birthday, :gender,
      :status_relationship, :address, :favorite_book, :favorite_quote
  end
end