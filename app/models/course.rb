class Course < ApplicationRecord
	has_many :votes
	has_many :users, through: :votes
	has_and_belongs_to_many :locations
	has_and_belongs_to_many :categories

	validates :name, :prerequisite, :description, presence: true
    
    validates :name,            length: { minimum: 10 }
    validates :prerequisite,    length: { minimum: 10 }
    validates :description,     length: { minimum: 30 }
end