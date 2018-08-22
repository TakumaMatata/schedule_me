class Course < ApplicationRecord
  belongs_to :term
  belongs_to :user
  has_many :lessons
  validates :language, presence: true, inclusion: {in: ["English"]}
  validates :level, presence: true, inclusion: {in: ["Novice", "Conversational", "Business", "Advanced"]}
  validates :duration, presence: true, inclusion: {in: [30, 45, 60, 90]}
end
