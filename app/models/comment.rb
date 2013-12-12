class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :like_comments
  has_many :users, through: :like_comments

  validates :content, presence: true

  def liked_by? user
    like_comments.find_by user_id: user.id
  end
end