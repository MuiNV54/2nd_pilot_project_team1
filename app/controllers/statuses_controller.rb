class StatusesController < ApplicationController
  before_action :authenticate_user!
  def new
  	@status = Status.new
  end

  def create
    @user = User.find params[:user_id]
  	@status = Status.new params.require(:status).permit :content
  	if @status.save
  		@status.update_attribute :host_id, current_user.id
      if current_user == @user
        @status.update_attribute :user_id, current_user.id
      else
        @status.update_attribute :user_id, @user.id
      end
  	end
  	redirect_to :back
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @user = User.find params[:user_id]
    @status = Status.find params[:id]
    if params[:flag]
      @status.get_permit params[:flag]
    else
      @status.update_attributes status_params
    end
    redirect_to :back
  end

  def destroy
    Status.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def status_params
    params.require(:status).permit :content
  end
end