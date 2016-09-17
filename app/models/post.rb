class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :like
  belongs_to :dislike
  belongs_to :forum
end
