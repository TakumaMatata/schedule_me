class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :room
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  has_many :memos, through: :enrollments
  validates :start_time, presence: true, uniqueness: { scope: :room_id }, uniqueness: { scope: :user_id }

  def add_students(student_ids)
    student_ids.each do |id|
      Enrollment.create(lesson: self, student_id: id)
    end
  end
end

