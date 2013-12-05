class Status < ActiveRecord::Base
	belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :like_statuses, dependent: :destroy
  has_many :users, through: :like_statuses
end