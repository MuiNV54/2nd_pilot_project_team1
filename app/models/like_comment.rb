class LikeComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  scope :liked, ->comment_id{where comment_id: comment_id}
end
