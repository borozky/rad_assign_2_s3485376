class Category < ApplicationRecord
	has_and_belongs_to_many :courses

	validates :name, presence: true
	validates :name, uniqueness: { message: "Category already exists" }
	validates :name, format: { without: /\A\d*\z/ }
end
