class Course < ApplicationRecord
	mount_uploader :image, CourseImageUploader
	
	
	has_many :votes
	has_many :voters, through: :votes

	belongs_to :user, class_name: "User", foreign_key: 'users_id'

	has_and_belongs_to_many :locations
	has_and_belongs_to_many :categories

	validates :name, :prerequisite, :description, presence: true
    
    validates :name,            length: { minimum: 10 }
    validates :prerequisite,    length: { minimum: 10 }
    validates :description,     length: { minimum: 30 }
    
    def recent_votes
    	return votes.select do |vote|
    		vote.created_at > last_vote_reset
    	end
    end
end
