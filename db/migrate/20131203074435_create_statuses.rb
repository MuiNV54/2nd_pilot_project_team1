class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.text :content
<<<<<<< HEAD
      t.integer :host_id
      t.string :permit, limit: 1,	default: Settings.permit.public
=======

>>>>>>> Comments
      t.timestamps
    end
  end
end
