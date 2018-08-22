class Term < ApplicationRecord
  has_many :courses
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
