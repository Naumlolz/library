require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user_1) { create(:user, password: BCrypt::Password.create("1111")) }
  let(:action_params) do
    {
      email: "email_not_example@.com",
      password: "1111"
    }
  end

  describe 'POST #user_perform_sign_in' do
    it 'checks out user`s email on database' do
      user_1 = nil
      expect{user_1}.to raise_error('The client with this email or password is not found')
    end
  end
end