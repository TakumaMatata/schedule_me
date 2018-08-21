class Student < ApplicationRecord
  has_many :lessons, through: :enrollments
  has_many :enrollments
end
