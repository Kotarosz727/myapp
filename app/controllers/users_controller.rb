# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.includes(avatar_attachment: [:blob]).where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @plays = @user.plays.all.includes(image_attachment: [:blob])
  end
  
end
