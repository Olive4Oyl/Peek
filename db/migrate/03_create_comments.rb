class CreateComments< ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :likes
      t.integer :dislikes
    end
  end
end
