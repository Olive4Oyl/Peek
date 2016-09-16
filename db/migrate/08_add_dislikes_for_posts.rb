class AddDislikesForPosts < ActiveRecord::Migration
  def change
    add_column :posts, :dislikes, :integer
  end
end
