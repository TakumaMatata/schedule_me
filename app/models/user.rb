class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :courses
  has_many :lessons
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: {in: 6..20}
  # validates :first_name, presence: true, length: { minimum: 2}
  # validates :last_name, presence: true, length: { minimum: 2}
  # validates :role, presence: true, inclusion: { in: ["manager", "teacher"]}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
