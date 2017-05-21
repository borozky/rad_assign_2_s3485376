require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # I didn't use fixtures because it gives me lots of errors about "password column cannot be found"
  
  test "user with valid details can be saved" do
    user = User.new
    user.name = "Valid user"
    user.email = "valid.user@rmit.edu.au"
    user.password = "123qweASD!@#"
    user.role = nil
    assert user.save
  end
  
  test "user with no info cannot be saved" do
    user = User.new
    assert_not user.save
  end
  
  test "user with missing required fields cannot be saved" do
    user = User.new
    
    user.name = nil
    user.email = "no.name@rmit.edu.au"
    user.password = "123qweASD!@#"
    assert_not user.save
    
    user.name = "ihave noemail"
    user.email = nil
    user.password = "123qweASD!@#"
    assert_not user.save
    
    user.name = "ihave nopassword"
    user.email = "ihave.nopassword@rmit.edu.au"
    user.password = nil
    assert_not user.save
  end
  
  test "user with short name cannot be saved" do
    user = User.new
    user.name = "s n"
    user.email = "short.name@rmit.edu.au"
    user.password = "123qweASD!@#"
    
    assert_not user.save
  end
  
  test "user with short email cannot be saved" do
    user = User.new
    user.name = "short email"
    user.email = "s@e.a"
    user.password = "!@#ASDqwe123"
  end
  
  test "user with invalid email cannot be saved" do
    user = User.new
    user.name = "ihave invalidemail"
    user.email = "invalid.email"
    user.password = "1234qwerASDF!@#\$"
    assert_not user.save
  end
  
  test "user with non-rmit email cannot be saved" do
    user = User.new
    user.name = "ihave nonrmitemail"
    user.email = "non.rmitemail@mit.edu.au"
    user.password = "123qweASD!@#"
    assert_not user.save
  end
  
  test "user with invalid password cannot be saved" do
    user = User.new
    user.name = "ihave invalidpassword"
    user.email = "ihave.invalidpassword@rmit.edu.au"
    user.password = "ihaveinvalidpassword"
    assert_not user.save
    
    
  end
  
  test "email that already exists cannot be saved" do
    user = User.new
    user.name = "Existing user"
    user.email = "existing.user@rmit.edu.au"
    user.password = "123qweASD!@#"
    assert user.save
    
    user2 = User.new
    user.name = "Another user"
    user.email = "existing.user@rmit.edu.au"
    user.password = "!@#QWEasd123"
    assert_not user2.save
  end
  
  
end
