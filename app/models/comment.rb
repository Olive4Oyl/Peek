class Comment < ActiveRecord::Base
  has_many :post_comments
  has_many :posts, :through => :post_comments
  has_many :users, :through => :posts
end
