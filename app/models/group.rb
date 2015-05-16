class Group < ActiveRecord::Base
	has_one :detail
	has_many :members
end

