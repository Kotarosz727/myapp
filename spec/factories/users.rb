FactoryBot.define do
  factory :user do
    name "Test"
    email "test@example.com"
    password "121212"
    password_confirmation "121212"
    #association :play
  end
end
