class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_id: current_user.id, play_id: params[:play_id])
    @favorites = Favorite.where(play_id: params[:play_id])
    if @favorite.save
      flash[:success] = "お気に入りしました"
      redirect_to root_path
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, play_id: params[:play_id])
    favorite.destroy
    @favorites = Favorite.where(play_id: params[:play_id]) 
  end  

end

  
