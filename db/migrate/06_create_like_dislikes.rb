class CreateLikeDislikes < ActiveRecord::Migration
  def change
    create_table :like_dislikes do |t|
      t.integer :post_id
      t.integer :comment_id


    end
  end
end
