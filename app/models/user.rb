class User < ApplicationRecord
  has_many :courses
  has_many :lessons
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
