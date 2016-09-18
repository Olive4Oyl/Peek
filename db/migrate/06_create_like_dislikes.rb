class CreateLikeDislikes < ActiveRecord::Migration
  def change
    create_table :like_dislikes do |t|
      t.integer :post_id
      t.integer :comment_id

      t.integer :like, :default => 0
      t.integer :dislike, :default => 0


    end
  end
end
