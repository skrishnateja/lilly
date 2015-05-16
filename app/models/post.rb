class Post < ActiveRecord::Base
	belongs_to :user
	has_many :commenters
	has_many :likers
end
