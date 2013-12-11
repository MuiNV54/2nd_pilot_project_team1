class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :effect_user_id
      t.string :temtype

      t.timestamps
    end
  end
end
