class PostComment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :post
end
