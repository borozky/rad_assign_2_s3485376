require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  test "valid locations can be saved" do
    location = locations(:valid_location1)
    assert location.save
    
    location2 = locations(:valid_location2)
    assert location2.save
  end
  
  test "location without details cannot be saved" do
    location = locations(:location_no_details)
    assert_not location.save
  end
  
  test "location with all zero cannot be saved" do
    location = locations(:location_all_zeros)
    assert_not location.save
  end
  
  test "location incomplete locations cannot be saved" do
    location = locations(:location_incomplete)
    assert_not location.save
  end
  
  test "location without dot cannot be saved" do
    location = locations(:location_no_dot)
    assert_not location.save
  end
  
  
end
