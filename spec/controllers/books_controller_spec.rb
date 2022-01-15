require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  login_user
  let(:book_1) { create(:book) }

  describe 'GET #index' do
    it 'renders the index page' do
      book_1
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      book_1
      get :show, params: { id: book_1.id }

      expect(response.status).to eq(200)
    end
  end
end