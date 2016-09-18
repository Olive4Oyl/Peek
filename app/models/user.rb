class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
<<<<<<< HEAD
  has_many :comments
  # has_many :likes_dislikes
  has_one :likes_dislikes
=======
  has_many :comments, :through => :posts
>>>>>>> 3e9d2a919cd4695ecb967adbf2c2195ae4aad2cd
  belongs_to :location
  belongs_to :like
  belongs_to :dislike
end
