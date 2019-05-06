require 'rails_helper'

RSpec.describe PlaysController, type: :controller do
  describe "Get #show" do
    user = FactoryBot.build(:user, name: "aaa", email:"aaa@sample.com")
    category = FactoryBot.create(:category)
    play = FactoryBot.create(:play, user: user, category: category)
    related_plays = FactoryBot.create_list(:play, 6, user: user, category: category)

    before do
      get :show, params: { id: play.id }
    end

    it "returns 200 response" do
      expect(response).to have_http_status :ok
    end

    it "show page" do
      expect(response).to render_template :show
    end

    it "assigns right @play" do
      expect(assigns(:play)).to eq play
    end

    it "assigns right within 5 kind of @related_plays" do
      expect(assigns(:related_plays).size).to eq 5
    end

  end
end
