require 'rails_helper'

RSpec.describe "players/edit.html.erb", type: :view do
  after(:all) { Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }

  it 'should contain simple_form' do
    @player = Player.find(player.id)
    render
    expect(rendered).to have_selector("input[type=submit][value='Submit']")
    expect(rendered).to have_link 'Back', players_path
  end
end