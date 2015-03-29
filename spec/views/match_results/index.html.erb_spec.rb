require 'rails_helper'

RSpec.describe "match_results/index.html.erb", type: :view do
  after(:all) { MatchResult.delete_all; Match.delete_all; Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }
  let!(:player2) { FactoryGirl.create(:player) }
  let!(:match) { FactoryGirl.create(:match, first_player: player.id, second_player: player2.id) }
  let!(:match_result) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player.id, points: 10) }
  let!(:match_result2) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player2.id, points: 6) }

  it 'should contain match_result & match_result2 data' do
    @winner = MatchResult.find(match_result.id)
    @loser = MatchResult.find(match_result2.id)

    render

    expect(rendered).to have_content Player.find(match_result.winner).name
    expect(rendered).to have_content Player.find(match_result.loser).name
    expect(rendered).to have_content match_result.points
    expect(rendered).to have_content match_result2.points

    expect(rendered).to have_link 'Next', classifications_path
  end
end