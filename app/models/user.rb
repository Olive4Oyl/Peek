class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments
  # has_many :likes_dislikes
  has_one :likes_dislikes
  belongs_to :location
end
