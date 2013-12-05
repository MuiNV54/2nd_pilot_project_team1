class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
<<<<<<< HEAD
<<<<<<< HEAD
      t.text :content
=======
      t.integer :host_id
      t.string :content
      t.string :permit, limit: 1,	default: Settings.permit.public
>>>>>>> 9b420653274d8f7347a062f6b5168eaaf1cdaeae
=======
      t.integer :host_id
      t.string :content
      t.string :permit, limit: 1,	default: Settings.permit.public
>>>>>>> 9b420653274d8f7347a062f6b5168eaaf1cdaeae

      t.timestamps
    end
  end
end
