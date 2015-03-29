class MatchesController < ApplicationController
  def new
    @match = Match.new
    @players = Player.all
    @players_not_all = @players.to_a - Player.where(id: params[:selected])
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = 'Match result.'
      redirect_to match_results_path
    else
      flash.now[:error] = "Can't start the Match."
      render 'new'
    end
  end

  private

  def match_params
    params.require(:match).permit(:first_player, :second_player)
  end
end
