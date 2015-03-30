require 'rails_helper'

RSpec.describe "matches/show.html.erb", type: :view do
  after(:all) { MatchResult.delete_all; Match.delete_all; Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }
  let!(:player2) { FactoryGirl.create(:player) }
  let!(:match) { FactoryGirl.create(:match, first_player: player.id, second_player: player2.id) }
  let!(:match_result) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player.id, points: 10) }
  let!(:match_result2) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player2.id, points: 6) }

  it "should contain match details" do
    @match = Match.find(match.id)

    render
    expect(rendered).to have_content player.name
    expect(rendered).to have_content match_results.points
    expect(rendered).to have_content player2.name
    expect(rendered).to have_content match_results2.points
    expect(rendered).to have_content match.created_at.strftime("%d %b. %Y")

    expect(rendered).to have_link 'PLAYERS RANKING', classifications_index_path
  end

end