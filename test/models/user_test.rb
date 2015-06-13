require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user has name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

end
