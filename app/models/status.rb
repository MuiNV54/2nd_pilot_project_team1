class Status < ActiveRecord::Base
	belongs_to :user
  belongs_to :status_host, foreign_key: "host_id", class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :like_statuses, dependent: :destroy
  has_many :users, through: :like_statuses

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

  def not_host?
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