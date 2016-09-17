class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :user_id
      t.integer :location_id
      t.string :content
      t.integer :like_id
      t.integer :dislike_id
    end
  end
end
