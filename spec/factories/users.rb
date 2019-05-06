# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    #name { 'Test' }
    sequence(:name) { |n| "name#{n}" }
    #email { 'test@example.com' }
    sequence(:email) { |n| "sample@sample.com#{n}" }
    password { '121212' }
    password_confirmation { '121212' }
    avatar { fixture_file_upload(Rails.root.join('spec', 'files', 'test.jpg'), 'image/jpg') }
  end
end
