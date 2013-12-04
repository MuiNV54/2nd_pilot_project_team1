class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  	:trackable, :validatable, :token_authenticatable, :lockable

  has_many :statuses
  has_many :friendships, dependent: :destroy
  has_many :friend_users, through: :friendships, source: :friended
  has_many :reverse_friendships, foreign_key: "friend_id",
    class_name: "Friendship", dependent: :destroy

  def friended? other_user
    friendships.find_by friend_id: other_user.id
  end

  def add_friend! other_user
    friendships.create! friend_id: other_user.id
  end

  def unfriend! other_user
    friendships.find_by(friend_id: other_user.id).destroy!
  end
end