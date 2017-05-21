class User < ApplicationRecord
  has_secure_password
  
  has_many :votes
  has_many :voted_courses, through: :votes, class_name: "Course"

  has_many :courses, foreign_key: "created_by_id"
  
  # email, name and password are needed
  validates :name, :email, :password_digest, :password, presence: true
  
  # test minimum lengths
  validates :name,    length: { minimum: 4 }
  validates :email,   length: { minimum: 4 }
  
  # user with existing email cannot be saved
  validates :email, uniqueness: true

  # rmit emails only allowed, skip validations for admins
  validates :email,   format: { with:  /\A[\w]+\.?[\w]+@(.*\.)?rmit\.edu\.au\z/i, 
                                message: "registration only available for RMIT staff" }
          
  # derived from http://stackoverflow.com/questions/1559751/regex-to-make-sure-that-the-string-contains-at-least-one-lower-case-char-upper
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*(_|[^\w])).{12,}\z/, 
                                 message: "Password should have at least 1 lowercase, uppercase, number, special character, and 8 more characters" }
                  
end
