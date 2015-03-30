module MatchesHelper
  def who_is_the_winner?(player1, player2, match)
    p1_ch = player1.chances
    p2_ch = player2.chances
    sum_chances = p1_ch + p2_ch

    p1_pct = (p1_ch * 100) / sum_chances
    p2_pct = (p2_ch * 100) / sum_chances

    p1_points = 0
    p2_points = 0

    while p1_points < 10 && p2_points < 10
      ss = SampleRand.new(e = [{el: "Player 1", pct: (p1_pct / 100)}, {el: "Player 2", pct: (p2_pct / 100)}])

      if ss.draw == 'Player 1'
        p1_points += 1
      else
        p2_points += 1
      end
    end

    compare = p1_points <=> p2_points
    if compare == 1
      MatchResult.create(winner: player1.id, loser: player2.id, match_id: match, player_id: player1.id, points: p1_points)
      MatchResult.create(winner: player1.id, loser: player2.id, match_id: match, player_id: player2.id, points: p2_points)

      chances = p1_ch / 100
      point_minus_chance = 1 - chances
      score = 0.5 + point_minus_chance
      player1.update(score: score)
    else
      MatchResult.create(winner: player2.id, loser: player1.id, match_id: match, player_id: player1.id, points: p1_points)
      MatchResult.create(winner: player2.id, loser: player1.id, match_id: match, player_id: player2.id, points: p2_points)

      chances = p2_ch / 100
      point_minus_chance = 1 - chances
      score = 0.5 + point_minus_chance
      player2.update(score: score)
    end
  end
end