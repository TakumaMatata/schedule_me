class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :room
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
  validates :start_time, presence: true

  def add_students(student_ids)
    student_ids.each do |id|
      Enrollment.create(lesson: self, student_id: id)
    end
  end
end
