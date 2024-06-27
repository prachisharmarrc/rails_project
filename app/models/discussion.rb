class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :content, presence: true
  validates :lesson, presence: true
end
