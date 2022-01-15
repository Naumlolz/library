require 'rails_helper'

RSpec.describe UserBooksController, type: :controller do
  login_user
  let(:users_book_1) { create(:users_book) }

  describe 'GET #index' do
    it 'renders the index page' do
      users_book_1
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the user`s book' do
      delete :destroy, params: { id: users_book_1.id }

      expect(response.status).to eq(302)
    end
  end
end