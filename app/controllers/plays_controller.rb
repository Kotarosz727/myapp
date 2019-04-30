class PlaysController < ApplicationController

  MAX_LIMITED_NUMBER_PLAY = 5

  before_action :find_play, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new edit]

  def index
    @plays = Play.includes(image_attachment: [:blob]).paginate(page: params[:page], per_page: 12)
  end

  def show
    @user = @play.user
    @related_plays = Play.related_plays(@play, MAX_LIMITED_NUMBER_PLAY)
   
  end

  def new
    @play = current_user.plays.build
  end

  def create
    @play = current_user.plays.build(play_params)
    @play.category_id = params[:category_id]
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

    def set_category
      @categories = Category.all.map { |c| [c.name, c.id] }
    end
end
