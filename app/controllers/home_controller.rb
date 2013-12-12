class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @statuses = Status.all
  	@status = Status.new
  	@group  = Group.new
    @comment = Comment.new
    @friendships = Friendship.all
  end

  def token
  end
end