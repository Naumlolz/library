require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe 'POST #update_profile' do
    context 'when given valid params' do
      it "updates user" do
        expect(User.count).to eq(1)
        expect do
          post :update_profile, params: { id: @user.id, user: {
            first_name: 'yolo', last_name: 'swaggins', age: 25, gender: "female"
          } 
        }
        end.to change {User.count}.by(0)
        expect(flash[:success]).to eq('Your profile was updated')
        expect(@user.reload.first_name).to eq('yolo')
        expect(@user.last_name).to eq('swaggins')
        expect(@user.age).to eq(25)
        expect(@user.gender).to eq('female')
        expect(response.status).to eq(302)
      end
    end

    context 'when given invalid params' do
      it 'returns error messages and renders back profile page', :example do
        expect(User.count).to eq(1)
        expect do
          post :update_profile, params: { id: @user.id, user: {
            first_name: '', last_name: '', age: nil, gender: ''
          } 
        }
        end.to change {User.count}.by(0)
        expect{@user.reload.first_name}.to raise_error("First name can't be blank")
      end
    end
  end
end
