class Category < ApplicationRecord
	has_and_belongs_to_many :courses

	validates :name, presence: true
	validates :name, format: { without: /\A\d*\z/ }
end
