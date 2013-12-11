class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find params[:id]
    @statuses = Status.all
  	@status = Status.new
  	@group  = Group.new
  	@user_friendship = current_user.friendships
  	@user_friend = @user_friendship.find_by friend_id: @user
    @comment = Comment.new
  end

  def edit
    @user = User.find params[:id]
  end

  def search_auto
    if params[:name].present?
      users = User.where("name LIKE ?", "%#{params[:name]}%").limit(4)
      if users
        data = users.map{|u| {name: u.name, id: u.id} }
        render json: data
      else
        render nothing:true
      end
    end
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
    params.require(:user).permit :name, :birthday, :gender,
      :status_relationship, :address, :favorite_book, :favorite_quote, :avatar, :cover
  end
end