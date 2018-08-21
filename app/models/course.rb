class Course < ApplicationRecord
  belongs_to :term
  belongs_to :user
  has_many :lessons
end
