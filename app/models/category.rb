class Category < ApplicationRecord
	has_and_belongs_to_many :courses

	validates :name, presence: true
	validates :name, uniqueness: { message: "Category already exists" }
	
	
	# cannot be all numbers
	validates :name, format: { without: /\A\d*\z/ }
	
	# allow letters, digits, spaces and these charactes " - . : ,"
	validates :name, format: { with: /\A[\w\d\s\-.()\:\,]+\z/i }
end
