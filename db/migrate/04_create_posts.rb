class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :user_id
      t.integer :forum_id
      t.string :content
    end
  end
end
