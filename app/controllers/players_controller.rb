class PlayersController < ApplicationController

  def index
    @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if name_exist?(params[:player][:last_name], params[:player][:first_name])
      flash.now[:error] = "Player with name #{params[:player][:last_name]} #{params[:player][:first_name]} already exists."
      render :new
    else
      if @player.save
        flash[:success] = 'Player created.'
        redirect_to @player
      else
        flash.now[:error] = 'Problem with creating the Player.'
        render :new
      end
    end
  end

  def edit
    @player = Player.friendly.find(params[:id])
  end

  def update
    @player = Player.friendly.find(params[:id])
    if name_exist?(params[:player][:last_name], params[:player][:first_name])
      flash.now[:error] = "Player with name #{params[:player][:last_name]} #{params[:player][:first_name]} already exists."
      render :new
    else
      if @player.update(player_params)
        flash[:success] = 'Player successfully updated.'
        redirect_to @player
      else
        flash.now[:error] = 'Problem with updating Player.'
        render :edit
      end
    end
  end

  def show
    @player = Player.friendly.find(params[:id])
  end

  def name_exist?(last, first)
    name = "#{last} #{first}"
    if Player.where(name: name).present?
      true
    else
      false
    end
  end

  private

  def player_params
    params.require(:player).permit(:last_name, :first_name, :avatar)
  end
end
