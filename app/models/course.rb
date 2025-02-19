class Course < ApplicationRecord
    has_many :enrollments
    has_many :users, through: :enrollments
    has_many :lessons
  
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  end
  