class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :post_id
      t.integer :comment_id


    end
  end
end
