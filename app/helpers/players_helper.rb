module PlayersHelper
  def chances_to_win(player)
    chances = 30
    if player.match_results.present?
      @last = player.match_results.order('created_at').last
      if @last.created_at > 1.day.ago
        chances += 20
      elsif @last.created_at > 7.day.ago
        chances += 15
      elsif @last.created_at > 30.day.ago
        chances += 10
      else
        chances += 0
      end

      victories = MatchResult.where(winner: player.id).count
      failures = MatchResult.where(loser: player.id).count
      if victories != 0 && failures != 0
        ratio = victories / failures
        scope = ((ratio * 100) / victories + failures) / 100
        chances_to_get = scope * 40
        chances += chances_to_get
      elsif victories != 0 && failures == 0
        scope = 1
        chances_to_get = scope * 40
        chances += chances_to_get
      else
        chances += 0
      end

      time = Time.now
      if time.friday? || time.saturday? || time.sunday? # Due to the fact that on weekends, the player focuses the mind on everything, just not on the game :)
        chances += 10
      end

    else

      time = Time.now
      if time.friday? || time.saturday? || time.sunday? # Due to the fact that on weekends, the player focuses the mind on everything, just not on the game :)
        chances += 10
      end
    end

    player.update(chances: chances)
  end
end