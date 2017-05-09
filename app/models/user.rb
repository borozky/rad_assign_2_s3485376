class User < ApplicationRecord
  has_secure_password
  
  has_many :votes
  has_many :voted_courses, through: :votes, class_name: "Course"

  has_many :courses, foreign_key: "created_by_id"
  
  validates :name, :email, :password_digest, :password, presence: true

  validates :name,    length: { minimum: 4 }
  validates :email,   length: { minimum: 4 }

  validates :email,   format: { with:  /[a-z]+\.[a-z]+@rmit\.edu\.au/i,
                              message: "Invalid RMIT email. Must be in format <fname>.<lname>@rmit.edu.au" }

  # derived from http://stackoverflow.com/questions/1559751/regex-to-make-sure-that-the-string-contains-at-least-one-lower-case-char-upper
  validates :password_digest, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*(_|[^\w])).{12,}\z/,
                               message: "Password should have at least 1 lowercase, uppercase, number, special character, and 8 more characters" }
    
                  
end
