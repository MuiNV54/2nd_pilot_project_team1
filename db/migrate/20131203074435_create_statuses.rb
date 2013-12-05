class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.integer :host_id
      t.string :content
      t.string :permit, limit: 1,	default: Settings.permit.public

      t.timestamps
    end
  end
end
