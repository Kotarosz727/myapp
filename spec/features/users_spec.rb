# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do

  let!(:user) { FactoryBot.create(:user, name: "Yamada", email: "yamada@sample.com") }

  it 'user can login' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。ようこそ！！！'
  end

  

end
