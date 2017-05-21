class Vote < ApplicationRecord
	belongs_to :voter, class_name: "User", foreign_key: "user_id"
	belongs_to :course
	validates :course_id, presence: true
	#validates :user_id, uniqueness: { scope: :course_id, message: "User already voted for this course."	} if :course_num_resets
	
	validate :can_vote, on: :create
	
	def can_vote
		# numvotes = Vote.where(user_id: voter.id, course_id: course.id).count
		
		# # cannot vote if there are no reset and user already voted
		# if Time.now > course.last_vote_reset
		# 	if course.vote_resets == 0 && numvotes >= 1
		# 		errors.add(:course, "User alredy voted for this course")
		# 		return false
		# 	end
			
		# 	if course.vote_resets > 0 && numvotes >= 2
		# 		errors.add(:course, "Votes for this course were reset at least once. You can only vote for this course once after reset")
		# 		return false
		# 	end
		# end
		
		numvotes = Vote.where(user_id: voter.id, course_id: course.id).select { |vote| vote.created_at > course.last_vote_reset }.count
		if numvotes > 0
			errors.add(:course, "User alredy voted for this course")
			return false
		end
		
		
	end
	
end
