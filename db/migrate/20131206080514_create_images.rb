class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.belongs_to :album
      t.belongs_to :user
      t.timestamps
    end
  end
end
