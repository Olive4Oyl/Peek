class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments
  # has_many :likes_dislikes
  has_one :likes_dislikes
  has_many :comments, :through => :posts
  belongs_to :location
  belongs_to :like
  belongs_to :dislike
end
