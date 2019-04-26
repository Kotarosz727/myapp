# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test' }
    email { 'test@example.com' }
    password { '121212' }
    password_confirmation { '121212' }
  end
end
