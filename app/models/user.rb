class User < ApplicationRecord
    has_secure_password
  
    has_many :enrollments
    has_many :courses, through: :enrollments
    has_many :discussions
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  