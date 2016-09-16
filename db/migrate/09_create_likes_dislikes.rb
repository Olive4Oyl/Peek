class CreateLikesDislikes < ActiveRecord::Migration
  def change
    create_table :likes_dislikes do |t|
      t.integer :likes
      t.integer :dislikes
      t.integer :user_id
    end
  end
end
