class Vote < ApplicationRecord
	belongs_to :voter, class_name: "User", foreign_key: "user_id"
	belongs_to :course

	validates :user_id, uniqueness: { scope: :course_id, message: "User already voted for this course."	}
end
