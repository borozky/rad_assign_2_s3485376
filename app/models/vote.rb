class Vote < ApplicationRecord
	belongs_to :voter, class_name: "User", foreign_key: "user_id"
	belongs_to :course
	
	validates :user_id, uniqueness: { scope: :course_id, message: "User already voted for this course."	}
	
	validate :check_user_can_vote_after_reset, on: :create
	
	
	def check_user_can_vote_after_reset
		
		#course = Course.find(course)
		
		# if users can only vote once before reset 
		# and 1 vote is allowed after after reset means
		# they can only vote twice on this course
		numvotes = Vote.where(user_id: voter.id).count
		
		if course.last_vote_reset.nil?
			return
		end
		
		if numvotes >= 2 && Time.now > course.last_vote_reset
			errors.add(:course, "Votes for this course were reset at least once. You can only vote for this course once after reset")
		end
		
	end
	
end
