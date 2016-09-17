class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :likes
  has_many :dislikes
end
