class Location < ActiveRecord::Base
has_many :users

has_many :forums

has_many :posts

end
