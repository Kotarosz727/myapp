# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Plays', type: :feature do
  it 'user can create a new play' do
    user = FactoryBot.create(:user)

    visit root_path

    click_on 'ログイン'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content user.name
    expect do
      click_on '新規作成'
      fill_in '題名', with: 'タイタニック'
      fill_in '詳細', with: 'hogehoge'
      fill_in '監督', with: 'ジェームズキャメロン'
      fill_in '予告編URL（youtube）', with: 'sample.youtube.com'
      attach_file 'play_image', "#{Rails.root}/spec/files/test.jpg"
      click_button 'Create Play'
    end.to change(user.plays, :count).by(1)
  end

  it 'correct play are shown in show template' do
    user = FactoryBot.create(:user)
    play_a = FactoryBot.create(:play, user: user)

    visit play_path(play_a)
    expect(page).to have_content play_a.title
    expect(page).to have_content play_a.description
    expect(page).to have_content play_a.director
    expect(page).to have_content play_a.user.name

    click_on 'logo'
    expect(current_path).to eq root_path
  end
end
