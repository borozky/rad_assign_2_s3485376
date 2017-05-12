require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  test "valid courses can be saved" do
    course = courses(:one)
    assert course.save
  end
  
  test "course with no location or category can still be saved" do
    course = courses(:two)
    assert course.save
  end
  
  test "course with short name cannot be saved" do
    course = courses(:three)
    assert_not course.save
  end
  
  test "course with short description cannot be saved" do
    course = courses(:four)
    assert_not course.save
  end
  
  test "course with no name cannot be saved" do
    course = courses(:five)
    assert_not course.save
  end
  
  test "course with short prerequisite cannot be saved" do
    course = courses(:six)
    assert_not course.save
  end
  
  test "course with no description cannot be saved" do
    course = courses(:seven)
    assert_not course.save
  end
  
  test "course with no prerequisite cannot be saved" do
    course = courses(:eight)
    assert_not course.save
  end
  
  
  
  
  
end
