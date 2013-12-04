class ImagesController < ApplicationController
  layout "blank"
  before_action :authenticate_user! 
  def index
  end

  def new
    @image = Image.new
  end

  def show
    @user = User.find params[:user_id]
    @album = @user.albums.find params[:album_id]
    @image = @album.images.find params[:id]
    @comment_image = CommentImage.new
  end

  def create
    @image = Image.new(image_params)
    @image.update_attributes(user_id: params[:user_id], album_id: params[:album_id])
    if @image.save
      redirect_to :back
    end
  end

  def destroy
    image = Image.find params[:id]
    image.destroy
    redirect_to :back
  end

  private
  def image_params
    params.require(:image).permit :photo
  end
end