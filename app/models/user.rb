class User < ActiveRecord::Base
	has_one :profile
	has_many :posts
	has_many :friendships
	has_many :friends, :through => :friendships

end
