require 'rails_helper'

RSpec.describe MatchResultsController, type: :controller do
  describe 'GET #index' do
    after(:all) { MatchResult.delete_all }

    let!(:match_result) { FactoryGirl.create(:match_result, winner: 1, loser: 2, match_id: 1, player_id: 1, points: 10) }
    let!(:match_result2) { FactoryGirl.create(:match_result, winner: 1, loser: 2, match_id: 1, player_id: 2, points: 4) }

    it "should assign @winner with match_result & @loser with match_result2" do
      @winner = MatchResult.find(match_result.id)
      @loser = MatchResult.find(match_result2.id)

      get :index

      expect(assigns(@winner)) == [match_result]
      expect(assigns(@loser)) == [match_result2]
    end

    it 'renders the index template' do
      @winner = MatchResult.find(match_result.id)
      @loser = MatchResult.find(match_result2.id)

      get :index

      expect(response).to render_template :index
    end
  end
end