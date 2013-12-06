class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :like_comments
  has_many :users, through: :like_comments

  validates :content, presence: true
end