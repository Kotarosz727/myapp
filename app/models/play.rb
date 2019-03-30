class Play < ApplicationRecord

  def index
    @plays = Play.all.order("created_at DESC")
  end

  def show
   
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to root_path
    else
      redirect_to @play
    end
  end
end
 
  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play =  Play.find(params[:id])
  end
