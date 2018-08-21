class Student < ApplicationRecord
  has_many :lessons, through: :enrollments
end
