# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :play do
    title { 'test' }
    director { 'John' }
    url { '123' }
    description { 'hogehoge' }
    image { fixture_file_upload(Rails.root.join('spec', 'files', 'test.jpg'), 'image/jpg') }
  end
end
