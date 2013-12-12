class CreateCommentImages < ActiveRecord::Migration
  def change
    create_table :comment_images do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :image
      t.timestamps
    end
  end
end
