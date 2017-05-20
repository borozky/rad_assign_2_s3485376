require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "user with no details cannot be saved" do
    @user = User.new
    assert_not @user.save
  end
  
  
end
