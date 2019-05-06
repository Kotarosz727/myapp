# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Plays', type: :feature do
  user = FactoryBot.create(:user, name: "sample", email:"sample@sample.com")
  category = FactoryBot.create(:category)
  play_a = FactoryBot.create(:play, user: user, category: category)

  it 'correct plays are shown in show template' do
    visit play_path(play_a)
    expect(page).to have_content play_a.title
    expect(page).to have_content play_a.description
    expect(page).to have_content play_a.director
    expect(page).to have_content play_a.user.name
    click_on 'logo'
    expect(current_path).to eq root_path
  end


end
