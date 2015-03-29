require 'rails_helper'

RSpec.describe "players/show.html.erb", type: :view do
  after(:all) { MatchResult.delete_all; Match.delete_all; Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }
  let!(:player2) { FactoryGirl.create(:player) }
  let!(:match) { FactoryGirl.create(:match, first_player: player.id, second_player: player2.id) }
  let!(:match_result) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
                  match_id: match.id, player_id: player.id, points: 10) }
  let!(:match_result2) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
                  match_id: match.id, player_id: player2.id, points: 6) }

  it "should contain player's data" do
    @player = Player.find(player.id)
    player_points = player.match_results.select(:points).reduce(:+)
    amount_of_match_results = player.match_results.count
    render
    expect(rendered).to have_content player.name
    expect(rendered).to have_content player.chances
    expect(rendered).to have_content player.place
    expect(rendered).to have_content player_points
    expect(rendered).to have_content (player_points / amount_of_match_results).round(3)

    expect(rendered).to have_selector('img', player.avatar.url(:medium))

    expect(rendered).to have_link 'Back', players_path
  end
end