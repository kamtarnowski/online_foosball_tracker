class PlayersController < ApplicationController
  def index
    @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = 'Player created.'
      redirect_to @player
    else
      flash.now[:error] = 'Problem with creating the Player.'
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:success] = 'Player successfully updated.'
      redirect_to @player
    else
      flash.now[:error] = 'Problem with updating Player.'
      render :edit
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:last_name, :first_name, :avatar)
  end
end
