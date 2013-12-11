class Activity < ActiveRecord::Base
	belongs_to :user
  belongs_to :effect_user, foreign_key: "effect_user_id", class_name: "User"

	scope :order_desc_created_at, ->{order "created_at DESC"}

	class << self
    def user_edit_profile! user
      Activity.create! user_id: user.id, effect_user_id: user.id , temtype: "EDIT_PROFILE"
    end

    def post_status! user, other_user
    	Activity.create! user_id: user.id, effect_user_id: other_user.id, temtype: "POST_STATUS"
    end

    def comment_status! user, other_user
    	Activity.create! user_id: user.id, effect_user_id: other_user.id, temtype: "COMMENT_STATUS"
    end

    def add_friend! user, other_user
    	Activity.create! user_id: user.id, effect_user_id: other_user.id, temtype: "ADD_FRIEND"
    end

    def like_status! user, other_user
    	Activity.create! user_id: user.id, effect_user_id: other_user.id, temtype: "LIKE__STATUS"
    end

    def share_status! user, other_user
    	Activity.create! user_id: user.id, effect_user_id: other_user.id, temtype: "SHARE__STATUS"
    end
  end
end