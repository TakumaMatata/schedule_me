class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :room
end
