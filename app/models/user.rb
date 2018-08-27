class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  include PgSearch
  pg_search_scope :search_by_first_name_and_last_name,
    against: [:first_name, :last_name],
    using: {
      tsearch: { prefix: true }
    }
  has_many :courses
  has_many :lessons
  mount_uploader :photo, PhotoUploader
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: {in: 6..20}, on: :create
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :role, presence: true, inclusion: { in: ["manager", "teacher"]}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
