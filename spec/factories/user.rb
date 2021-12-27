FactoryBot.define do
  factory :user do
    first_name { "Ivan" }
    last_name { "Ivanov" }
    email { "email_example@.com" }
    password { "example_password" }
    password_confirmation { "example_password" }
  end
end