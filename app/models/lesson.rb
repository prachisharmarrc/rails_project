class Lesson < ApplicationRecord
  belongs_to :course
  has_many :discussions

  validates :title, presence: true
  validates :content, presence: true

end
