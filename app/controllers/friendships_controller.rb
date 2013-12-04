class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find params[:user_id]
  end

  def create
    @user = User.find params[:friendship][:friend_id]
    current_user.add_friend! @user
    @user.add_friend! current_user
    redirect_to @user
  end

  def destroy
    @user = Friendship.find(params[:id]).friended
    current_user.unfriend! @user
    @user.unfriend! current_user
    redirect_to @user
  end

  private 
  def load_object
  end
end