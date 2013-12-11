class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  	:trackable, :validatable, :token_authenticatable, :lockable
  has_many :friendships, dependent: :destroy
  has_many :friend_users, through: :friendships, source: :friended
  has_many :reverse_friendships, foreign_key: "friend_id",
    class_name: "Friendship", dependent: :destroy
  has_many :memberships
  has_many :groups
  has_many :statuses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :like_statuses, dependent: :destroy
  has_many :liked_statuses, through: :like_statuses, source: :status
  has_many :like_comments, dependent: :destroy
  has_many :shares
  has_many :share_statuses, through: :shares, dependent: :destroy, source: :status
  has_many :liked_comments, through: :like_comments, source: :comment
  has_many :albums, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comment_images, dependent: :destroy
  mount_uploader :avatar, ImageUploader
  mount_uploader :cover, ImageUploader
  validates :gender, presence: true

  def friended? other_user
    friendships.find_by friend_id: other_user.id
  end

  def add_friend! other_user
    friendships.create! friend_id: other_user.id
  end

  def unfriend! other_user
    friendships.find_by(friend_id: other_user.id).destroy!
  end

  def get_permit string
    case string
    when "public"
      self.update_attributes permit: Settings.permit.public
    when "friend"
      self.update_attributes permit: Settings.permit.friend
    when "private"
      self.update_attributes permit: Settings.permit.private
    end
  end

  def public?
    permit == Settings.permit.public
  end

  def private?
    permit == Settings.permit.private
  end

  def friend?
    permit == Settings.permit.friend
  end
end