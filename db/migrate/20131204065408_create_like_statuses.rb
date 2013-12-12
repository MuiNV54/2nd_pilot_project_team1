class CreateLikeStatuses < ActiveRecord::Migration
  def change
    create_table :like_statuses do |t|
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
