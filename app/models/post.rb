class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_comments
  has_many :comments, :through => :post_comments
end
