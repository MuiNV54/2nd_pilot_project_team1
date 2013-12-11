class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @statuses = Status.all
  	@status = Status.new
  	@group  = Group.new
    @comment = Comment.new
  end

  def token
  end
end