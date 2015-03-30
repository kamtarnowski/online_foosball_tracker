class MatchesController < ApplicationController
  def new
    @match = Match.new
    @players = Player.all
    @players_not_all = @players.to_a - Player.where(id: params[:selected])
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      player1 = Player.find(@match.first_player)
      player2 = Player.find(@match.second_player)
      chances_to_win(player1)
      chances_to_win(player2)
      who_is_the_winner?(player1, player2, @match.id)

      flash[:success] = 'Match result.'
      redirect_to show_match_path(@match)
    else
      flash.now[:error] = "Can't start the Match."
      render 'new'
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  private

  def match_params
    params.require(:match).permit(:first_player, :second_player)
  end
end
