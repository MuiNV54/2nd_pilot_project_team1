class LikeStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  scope :liked, ->status_id{where status_id: status_id}
end
