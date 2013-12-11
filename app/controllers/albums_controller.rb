class AlbumsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @user = User.find params[:user_id]
    @album = current_user.albums.new
  end

  def show
    @user = User.find params[:user_id]
    @album = Album.find params[:id]
    @image = Image.new
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params_album)
    @album.update_attribute(:user_id, params[:user_id])
    if @album.save
      flash[:success] = "Created album"
    end
    redirect_to :back
  end

  def destroy
    @album = Album.find params[:id]
    @album.destroy
    redirect_to :back
  end
  private 
  def params_album
    params.require(:album).permit :title, :description
  end
end