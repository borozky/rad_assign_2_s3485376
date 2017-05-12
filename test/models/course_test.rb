require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  test "valid courses can be saved" do
    course = Course.new
    course.name = "Database Concepts"
    course.description = "This is the description of database concept. It is a course about SQL and RDBMS"
    prerequisite = "Basic computer literacy"
    
    assert course.save
  end
  
  test "course with no location or category can still be saved" do
    # course = courses(:two)
    # assert course.save
    
    course = Course.new
    course.name = "Rapid Application Development"
    course.description ="Nulla dignissim leo a purus commodo, nec facilisis nibh vulputate."
    prerequisite = "Web Programming"
    
    assert course.save
  end
  
  test "course with short name cannot be saved" do
    # course = courses(:three)
    # assert_not course.save
  end
  
  test "course with short description cannot be saved" do
    # course = courses(:four)
    # assert_not course.save
  end
  
  test "course with no name cannot be saved" do
    # course = courses(:five)
    # assert_not course.save
  end
  
  test "course with short prerequisite cannot be saved" do
    # course = courses(:six)
    # assert_not course.save
  end
  
  test "course with no description cannot be saved" do
    # course = courses(:seven)
    # assert_not course.save
  end
  
  test "course with no prerequisite cannot be saved" do
    # course = courses(:eight)
    # assert_not course.save
  end
  
  
  
  
  
end
