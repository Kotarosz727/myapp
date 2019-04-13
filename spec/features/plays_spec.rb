require 'rails_helper'

RSpec.feature "Plays", type: :feature do
  
  scenario "user creates a new play" do
    user = FactoryBot.create(:user)

    visit root_path

    click_on "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content user.name
    expect{
      click_on "新規作成"
      fill_in "題名", with: "タイタニック"
      fill_in "詳細", with: "hogehoge"
      fill_in "監督", with: "ジェームズキャメロン"
      fill_in "予告編URL（youtube）", with: "sample.youtube.com"
      attach_file "画像", "#{Rails.root}/spec/files/test.jpg"
      click_button "Create Play"
    }.to change(user.plays, :count).by(1)
  end
end
