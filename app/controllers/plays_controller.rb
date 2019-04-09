class PlaysController < ApplicationController

  before_action :find_play, only: [:show, :edit, :update, :destroy]

  def index
    @plays = Play.includes(image_attachment: [:blob]).paginate(page: params[:page], per_page: 12).random 
  end

  def show
    @user = @play.user
  end

  def new
    @play = current_user.plays.build
  end

  def create
    @play = current_user.plays.build(play_params)
    if @play.save
      redirect_to play_path(@play)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @play.update(play_params)
      redirect_to play_path(@play)
    else
      render edit
    end
  end

  def destroy
    @play.destroy
    redirect_to root_path
  end
 
  private

    def play_params
      params.require(:play).permit(:title, :description, :director, :image, :url)
    end

    def find_play
      @play = Play.find(params[:id])
    end
end