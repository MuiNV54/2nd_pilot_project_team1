class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firt_name
      t.string :last_name
      t.string :email
      t.datetime :birth_day
      t.string :remember_token
      t.string :password_digest

      t.timestamps
    end
  end
end
