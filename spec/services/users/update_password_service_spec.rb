RSpec.describe Users::UpdatePasswordService do
  let(:user_1) { create(:user, password: BCrypt::Password.create("1111")) }
  let(:service_params) do 
    {
      user: user_1,
      old_password: "1111",
      new_password: "12345",
      new_password_confirmation: "12345"
    }
  end

  it "should check old user`s password" do
    expect do
      described_class.new(
        service_params.merge(old_password: "1112")
      ).call
    end.to raise_error(ServiceError, "Password doesn`t match")
  end

  it "should check new user`s password" do
    expect do
      described_class.new(
        service_params.merge(new_password_confirmation: "7777")
      ).call
    end.to raise_error(ServiceError, "New password doesn`t match")
  end
end