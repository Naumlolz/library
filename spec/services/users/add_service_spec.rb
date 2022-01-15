require 'rails_helper'

RSpec.describe Users::AddService do
  let(:user_1) {create(:user)}
  let(:book_1) {create(:book)}

  it "should creates users book" do
    expect(UsersBook.count).to eq(0)

    described_class.new(user_id: user_1.id, book_id: book_1.id).perform

    expect(UsersBook.count).to eq(1)
  end
end