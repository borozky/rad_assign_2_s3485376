require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  # i have problems with fixtures, relating to password and password_digests
  # in this test user information will be entered manually
  
  test "valid vote can be saved" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    vote = Vote.new
    vote.voter = user
    vote.course = courses(:valid_course1)
    vote.thumbs_up = false
    
    assert vote.save
  end
  
  test "votes with empty fields cannot be saved" do
    vote = Vote.new
    assert_not vote.save
  end
  
  test "votes without the voter cannot be saved" do
    vote = Vote.new
    vote.course = courses(:valid_course1)
    vote.thumbs_up = false
    
    assert_not vote.save
  end
  
  test "votes without the course cannot be saved" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    vote = Vote.new
    vote.voter = user
    vote.thumbs_up = true
    
    assert_not vote.save
  end
  
  test "votes without a choice cannot be saved" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    vote = Vote.new
    vote.voter = user
    vote.course = courses(:valid_course1)
    vote.thumbs_up = nil
    
    assert_not vote.save
  end
  
  test "user cannot vote to a course more than once if course has not been reset" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    
    vote = Vote.new
    vote.voter = user
    vote.course = courses(:valid_course_no_reset)
    vote.thumbs_up = true
    assert vote.save, "A vote must be saved to test uniqueness of the votes"
    
    vote2 = Vote.new
    vote2.voter = user
    vote2.course = courses(:valid_course_no_reset)
    vote2.thumbs_up = false
    assert_not vote2.save, "Should not vote to course more than once"
  end
  
  test "user can vote again once to a course that has been reset once" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    course = courses(:valid_course_no_reset)
    
    vote = Vote.new
    vote.voter = user
    vote.course = course
    vote.thumbs_up = true
    assert vote.save, "This vote must be saved to allow user to vote again for course"
    
    course.vote_resets += 1
    course.last_vote_reset = Time.now
    assert course.save, "Course's vote resets should be recorded"
    
    vote2 = Vote.new
    vote2.voter = user
    vote2.course = course
    vote2.thumbs_up = false
    assert vote2.save, "User should still able to vote once after reset"
    
    vote3 = Vote.new
    vote3.voter = user
    vote3.course = course
    vote3.thumbs_up = true
    assert_not vote3.save, "User should still not able to vote twice after reset"
  end
  
  test "user cannot vote more than once even if he didn't have the chance to vote before the reset" do
    user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
    course = courses(:valid_course_reset_once) # this vote already been reset once
    
    vote = Vote.new
    vote.voter = user
    vote.course = course
    vote.thumbs_up = true
    assert vote.save, "This vote must be saved to allow user to vote again for course"
    
    vote2 = Vote.new
    vote2.voter = user
    vote2.course = course
    vote2.thumbs_up = false
    assert_not vote2.save, "User should still able to vote once after reset"
  end
  
  
  
  
  
  
  
  # test "can always vote for the first time" do
  #   user = User.create(name: "Joshua Orozco", email: "joshua.orozco@rmit.edu.au", password: "123qweASD!@#")
  #   course = courses(:valid_course1)
    
  #   vote = Vote.new
  #   vote.user = user
  #   vote.course = course
    
    
    
  #   vote.user = users(:vali)
  # end
end
