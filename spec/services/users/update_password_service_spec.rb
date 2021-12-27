RSpec.describe Users::UpdatePasswordService do
  # let(:user_1) { create(:user) }

  # it "should update password" do
  #   result = Users::UpdatePasswordService.new(
  #     user: user_1,
  #     old_password: "1111",
  #     new_password: "1234",
  #     new_password_confirmation: "1234"
  #   ).call

  #   expect(result).to be_truthy
  # end

  # it "should check out user`s email" do
  #   @user = User.find_by(id: 1)
  #   user_db_password = BCrypt::Password.new(@user.password)
  #   expect do
  #     Users::UpdatePasswordService.new(
  #       user_id: "1",
  #       old_password: "password",
  #       new_password: "1234",
  #       new_password_confirmation: "1234"
  #     ).call
  #   end.to raise_error(ServiceError, 'Password doesn`t match')
  # end
end