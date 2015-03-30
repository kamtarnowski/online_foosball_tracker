require 'rails_helper'

RSpec.describe "classifications/index.html.erb", type: :view do
  after(:all) { MatchResult.delete_all; Match.delete_all; Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }
  let!(:player2) { FactoryGirl.create(:player) }
  let!(:match) { FactoryGirl.create(:match, first_player: player.id, second_player: player2.id) }
  let!(:match_result) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player.id, points: 10) }
  let!(:match_result2) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
      match_id: match.id, player_id: player2.id, points: 6) }

  it 'should render table rows ("th" + 2x"td")' do
    @players = Player.order(:place).page(params[:page]).per(20)

    render
    expect(rendered).to have_selector('tr', count: 3)
  end

  it 'should contain Player attributes' do
    @players = Player.order(:place).page(params[:page]).per(20)

    render
    expect(rendered).to have_content(player.place)
    expect(rendered).to have_content(player.name)
    expect(rendered).to have_content(player.score)
    expect(rendered).to have_content(player.match_results.where(:winner => player.id).count)
    expect(rendered).to have_content(player.match_results.where(:loser => player.id).count)
    expect(rendered).to have_selector('a', player.avatar.url)
    expect(rendered).to have_selector('img', player.avatar.url(:thumb))

    expect(rendered).to have_link 'Create a New Match', matches_new_path
    expect(rendered).to have_link 'Players list', players_path
  end
end
