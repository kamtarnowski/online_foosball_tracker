require 'rails_helper'

RSpec.describe "matches/new.html.erb", type: :view do
  it 'should contain simple form' do
    @match = Match.new
    render
    expect(rendered).to have_selector("input[type=submit][value='Play the Match']")
    expect(rendered).to have_link 'Back', players_path
  end
end
