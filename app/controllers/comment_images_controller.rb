class CommentImagesController < ApplicationController
  before_action :authenticate_user!
  def create
    if params_comment_image
      comment_image = CommentImage.new params_comment_image
      comment_image.update_attributes user_id: current_user.id, image_id: params[:image_id]
      if comment_image.save
      end
      redirect_to :back
    end
  end
  private 
  def params_comment_image
    params.require(:comment_image).permit :content
  end
end