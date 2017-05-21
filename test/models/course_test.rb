require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  test "valid courses can be saved" do
    
    course = courses(:valid_course1)
    assert course.save
  end
  
  test "course with no location or category can still be saved" do
    
    # :valid_course2 has no location and has no category
    course = courses(:valid_course2)
    assert course.save
    
  end
  
  test "course with short name cannot be saved" do
    course = courses(:course_short_name)
    assert_not course.save
  end
  
  test "course with short description cannot be saved" do
    course = courses(:course_short_description)
    assert_not course.save
  end
  
  test "course with no name cannot be saved" do
    course = courses(:course_no_name)
    assert_not course.save
  end
  
  test "course with short prerequisite cannot be saved" do
    course = courses(:course_short_prerequisite)
    assert_not course.save
  end
  
  test "course with no description cannot be saved" do
    course = courses(:course_no_description)
    assert_not course.save
  end
  
  test "course with no prerequisite cannot be saved" do
    course = courses(:course_no_prerequisite)
    assert_not course.save
  end
  
  
  
  
  
end
