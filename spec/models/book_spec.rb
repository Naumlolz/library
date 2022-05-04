# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'return created book' do
    book = build(:book, title: 'Book_title', description: "Book description")

    expect(book)
  end
end
