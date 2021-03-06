class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :status_id
      t.text :content, null: false

      t.timestamps
    end
  end
end
