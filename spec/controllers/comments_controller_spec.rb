# require 'rails_helper'

# RSpec.describe "DELETE #destroy" do
#   let(:user) { FactoryBot.create(:user) }
#   let(:book) { FactoryBot.create(:book) }
#   before do
#     sign_in(user)
#   end

#   it "deletes comment" do
#     comment = FactoryBot.create(:comment, book: book, user: user)

#     expect do
#       delete :destroy, params { id: comment.id, book_id: book.id }
#     end.to change(Comment, :count).by(-1)
#     expect(response).to be_successful
#     expect(response).to have_http_status(:redirect)
#   end
# end