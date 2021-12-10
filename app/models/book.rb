class Book < ApplicationRecord
  has_one_attached :avatar

  validates :title, :description, presence: true

  has_many :comments
  has_many :users_books
  has_many :users, through: :users_books
end
