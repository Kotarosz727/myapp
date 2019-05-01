# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_play

  def create
    @favorite = Favorite.create(user_id: current_user.id, play_id: params[:play_id])
    render 'plays/create.js.erb'
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, play_id: params[:play_id])
    favorite.destroy
    render 'plays/destroy.js.erb'
  end

  def set_play
    @play = Play.find(params[:play_id])
  end
end
