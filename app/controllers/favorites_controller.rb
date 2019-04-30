class FavoritesController < ApplicationController
 
  before_action :set_play

  def create
    @favorite = Favorite.create(user_id: current_user.id, play_id: params[:play_id])
    @favorites = Favorite.where(play_id: params[:play_id])
    render 'index.js.erb'
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, play_id: params[:play_id])
    @favorites = Favorite.where(play_id: params[:play_id]) 
    favorite.destroy
    render 'index.js.erb'
  end  

  def set_play
    @play = Play.find(params[:play_id])
  end

end

  
