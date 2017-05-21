class Location < ApplicationRecord
	has_and_belongs_to_many :courses

	validates :at, presence: true
	validates :at, uniqueness: { message: "Location already exists" }
    validates :at, format: { with: /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/,
                             message: "Invalid location format"}
end
