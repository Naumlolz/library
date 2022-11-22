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
require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'return created book' do
    book = build(:book, title: 'Book_title', description: "Book description")

    expect(book)
  end
end
