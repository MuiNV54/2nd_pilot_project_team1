class Status < ActiveRecord::Base
	belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :status_host, foreign_key: "host_id", class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :like_statuses, dependent: :destroy
  has_many :users, through: :like_statuses
  has_many :shares
  has_many :share_by_users, through: :shares, dependent: :destroy, source: :status

  validates :content, presence: true

  scope :order_desc_created_at, ->{order "created_at DESC"}

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

  def shared_by? user
    shares.find_by user_id: user.id
  end

  def created_by? user
    user_id == user.id
  end

  def concern? user
    user_id == user.id
  end

  def create_by_friend_of? user
    check = false
    self.share_by_users.each do |shared_user|
      if shared_user.friended? user
        check = true
        break
      end
    end
    return check
  end

  def create_by_friend?
    self.status_host != self.user
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