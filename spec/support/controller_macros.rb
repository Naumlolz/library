module ControllerMacros
  def login_user
    before(:each) do
      @user = FactoryBot.create(:user)
      request.session[:member_type] = 'User'
      request.session[:member_id] = @user.id
    end
  end
end