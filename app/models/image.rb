class Image < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  belongs_to :album
  belongs_to :user
  has_many :comment_images, dependent: :destroy
end
