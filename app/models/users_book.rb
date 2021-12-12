class UsersBook < ApplicationRecord
  validates :user_id, :book_id, presence: true

  belongs_to :user
  belongs_to :book

  validates :book_id, :uniqueness => {:scope => :user_id}
end
