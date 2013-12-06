class Share < ActiveRecord::Base
	belongs_to :user
	belongs_to :status

	scope :shared, ->status_id{where status_id: status_id}
end
