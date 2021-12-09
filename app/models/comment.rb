class Comment < ApplicationRecord
  validates :body, :user_id, :book_id, presence: true

  belongs_to :user
  belongs_to :book
end
