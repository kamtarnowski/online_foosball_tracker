class UpdateRating
  def update_rating
    Player.all.each do |player|
      if player.match_results.present?
        @last = player.match_results.order(created_at: :desc).last
        if @last.created_at > 1.day.ago
          player.update(score: player.score + 0.3)
        elsif @last.created_at > 7.day.ago
          player.update(score: player.score + 0.2)
        elsif @last.created_at > 30.day.ago
          player.update(score: player.score + 0.1)
        else
          player.update(score: player.score + 0.0)
        end
      end
    end
  end
end