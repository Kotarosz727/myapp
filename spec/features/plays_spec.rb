# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Plays', type: :feature do
  it 'user can create a new play' do
   
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。ようこそ！！！'
    
    expect do
      visit new_play_path
      select "ロマンス", from: 'category_id'
      fill_in '題名', with: 'タイタニック'
      fill_in '詳細', with: 'hogehoge'
      fill_in '監督', with: 'ジェームズキャメロン'
      fill_in '予告編URL（youtube）', with: 'sample.youtube.com'
      attach_file 'play_image', "#{Rails.root}/spec/files/test.jpg"
      click_button '登録する'
      end.to change(user.plays, :count).by(1)
  end

  it 'correct plays are shown in show template' do
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    play_a = FactoryBot.create(:play, user: user, category:category)
    

    visit play_path(play_a)
    expect(page).to have_content play_a.title
    expect(page).to have_content play_a.description
    expect(page).to have_content play_a.director
    expect(page).to have_content play_a.user.name

    click_on 'logo'
    expect(current_path).to eq root_path
  end
end
