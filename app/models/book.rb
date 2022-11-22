# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint
#  genre_id    :bigint
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#  index_books_on_genre_id   (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (genre_id => genres.id)
#
class Book < ApplicationRecord
  has_one_attached :avatar

  validates :title, :description, presence: true

  paginates_per 6

  has_many :comments, dependent: :destroy
  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books
  belongs_to :genre
  belongs_to :author
end
