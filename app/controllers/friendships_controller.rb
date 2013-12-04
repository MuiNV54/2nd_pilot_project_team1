class FriendshipsController < ApplicationController
  before_action :load_object

  def index
  end

  def create
    current_user.add_friend! @user
    @user.add_friend! current_user
    redirect_to @user
  end

  def destroy
    current_user.unfriend! @user
    @user.unfriend! current_user
    redirect_to @user
  end

  private 
  def load_object
    @user = User.find params[:user_id]
  end
end