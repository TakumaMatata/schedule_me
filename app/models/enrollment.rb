class Enrollment < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  has_many :memos
end
