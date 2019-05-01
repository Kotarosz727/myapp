# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test' }
    email { 'test@example.com' }
    password { '121212' }
    password_confirmation { '121212' }
    avatar { fixture_file_upload(Rails.root.join('spec', 'files', 'test.jpg'), 'image/jpg') }
  end
end
