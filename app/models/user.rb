class User < ApplicationRecord
  has_one_attached :avatar
  
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, confirmation: true

  has_many :comments
  has_many :users_books
  has_many :books, through: :users_books
end
