require 'rails_helper'

RSpec.describe "players/new.html.erb", type: :view do
  it 'should contain simple_form' do
    @player = Player.new
    render
    expect(rendered).to have_selector("input[type=submit][value='Submit']")
    expect(rendered).to have_link 'Back', players_path
  end
end