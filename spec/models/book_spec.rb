require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'return created book' do
    book = build(:book, title: 'Book_title', description: "Book description")

    expect(book)
  end
end