FactoryBot.define do
  factory :play do
    title "test"
    director "John"
    url "123"
    description "hogehoge"
    #association :user

    after(:build) do |play|
      play.image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    end

  end  
end
