# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.includes(avatar_attachment: [:blob])
  end

  def show
    @user = User.find(params[:id])
    @plays = @user.plays.all.includes(image_attachment: [:blob])
    @fav_movies = @user.fav_movies.includes(image_attachment: [:blob])
  end
  
end
