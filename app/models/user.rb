class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments, :through => :posts
  has_many :likes_dislikes
end
