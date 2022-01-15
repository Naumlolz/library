FactoryBot.define do
  factory :comment do
    body {"comment_body"}
    association :user
    association :book
  end
end