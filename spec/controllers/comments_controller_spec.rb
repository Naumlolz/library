require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:user_1) {create(:user)}
  let(:book_1) {create(:book)}
  let(:comment_1) {create(:comment)}
  
  describe 'POST #create' do
    context 'when given valid params' do
      it 'creates a new comment' do
        expect(Comment.count).to eq(0)

        expect do
          post :create, params: { 
            body: "comment_body",
            user_id: user_1.id,
            id: book_1.id
          }
        end.to change{ Comment.count}.by(1)

        expect(response.status).to eq(302)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the comment' do
      delete :destroy, params: { id: comment_1.id, book_id: comment_1.book_id }
      
      expect(response).to redirect_to book_path(id: comment_1.book_id)
    end
  end
end