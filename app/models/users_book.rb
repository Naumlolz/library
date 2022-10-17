# == Schema Information
#
# Table name: users_books
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_users_books_on_book_id  (book_id)
#  index_users_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
class UsersBook < ApplicationRecord
  validates :user_id, :book_id, presence: true

  belongs_to :user
  belongs_to :book

  validates :book_id, :uniqueness => { :scope => :user_id }
end
