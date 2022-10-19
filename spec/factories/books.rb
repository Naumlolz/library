# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :bigint
#
# Indexes
#
#  index_books_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#
FactoryBot.define do
  factory :book do
    title { "Book_title" }
    description { "Book description" }
  end
end
