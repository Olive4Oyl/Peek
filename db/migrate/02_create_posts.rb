class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :likes
      t.integer :dislikes
      t.integer :share_count
      t.integer :user_id
    end
  end
end
