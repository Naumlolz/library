# == Schema Information
#
# Table name: genres_books
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  genre_id   :bigint
#
# Indexes
#
#  index_genres_books_on_book_id   (book_id)
#  index_genres_books_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (genre_id => genres.id)
#
require 'rails_helper'

RSpec.describe GenresBook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
