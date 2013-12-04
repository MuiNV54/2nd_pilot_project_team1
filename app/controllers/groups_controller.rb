class GroupsController < ApplicationController
	def index
		@user = User.find params[:id]
	end

  def show
  	@user = User.find params[:user_id]
  	@group = Group.find params[:id]
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new params.require(:group).permit :name
  	if @group.save
  		@group.update_attribute(:user_id, current_user.id)
  		Membership.create!(user_id: current_user.id, group_id: @group.id )
  	end
  	redirect_to user_path(current_user)
  end
end