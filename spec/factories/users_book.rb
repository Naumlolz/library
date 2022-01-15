FactoryBot.define do
  factory :users_book do
    association :user
    association :book
  end
end