require 'rails_helper'

RSpec.describe Users::SignUpService do
  let(:user_1) { create(:user) }
  let(:service_params) do 
    {
      first_name: "Yolo",
      last_name: "Swaggins",
      email: "yoloswaggins.com",
      password: "1234",
      password_confirmation: "1234"
    }
  end
  let(:empty_service_params) do 
    {
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      password_confirmation: ""
    }
  end

  it "should creates user" do
    expect(User.count).to eq(0)

    described_class.new(service_params).perform

    expect(User.count).to eq(1)
    created_user = User.first
    expect(created_user.first_name).to eq('Yolo')
  end

  it "fails if user`s email exists" do
    expect do
      described_class.new(
        service_params.merge(email: user_1.email)
      ).perform
    end.to raise_error(ServiceError, "This email`s already taken")
  end

  it "fails if passwords doesn`t match" do
    expect do
      described_class.new(
        service_params.merge(password_confirmation: "7777")
      ).perform
    end.to raise_error(ServiceError, "The password doesn`t match")
  end

  it "fails if user isn`t valid" do
    expect do
      described_class.new(empty_service_params).perform
    end.to raise_error(ServiceError, ["First name can't be blank", "Last name can't be blank", "Email can't be blank", "Password can't be blank"].to_s)
  end
end