class Student < ApplicationRecord
  has_many :lessons, through: :enrollments
  has_many :enrollments
  validates :name, presence: true
end
