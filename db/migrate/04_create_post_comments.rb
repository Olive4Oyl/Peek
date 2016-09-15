class CreatePostComments< ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :comment_id
      t.integer :post_id
    end
  end
end
