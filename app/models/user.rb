class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments, :through => :posts
  belongs_to :location
  belongs_to :like
  belongs_to :dislike
end
