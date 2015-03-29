require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe 'validation of data' do
    after(:all) { MatchResult.delete_all; Match.delete_all; Player.delete_all }

    let!(:player) { FactoryGirl.create(:player) }
    let!(:player2) { FactoryGirl.create(:player) }
    let!(:match) { FactoryGirl.create(:match, first_player: player.id, second_player: player2.id) }
    let!(:match_result) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
        match_id: match.id, player_id: player.id, points: 10) }
    let!(:match_result2) { FactoryGirl.create(:match_result, winner: player.id, loser: player2.id,
        match_id: match.id, player_id: player2.id, points: 6) }

    subject { match_result }

    context 'without presence of attributes' do
      before { match_result.winner = '' }
      it { should be_invalid }

      before { match_result.loser = '' }
      it { should be_invalid }

      before { match_result.match_id = '' }
      it { should be_invalid }

      before { match_result.player_id = '' }
      it { should be_invalid }

      before { match_result.points = '' }
      it { should be_invalid }
    end

    context 'with presence of attributes' do
      it { should be_valid }
    end
  end

  describe 'associations to the Model' do
    it 'should belongs to the Match' do
      mr = MatchResult.reflect_on_association(:match)
      mr.macro == :belongs_to
    end

    it 'should belongs to the Player' do
      mr = MatchResult.reflect_on_association(:player)
      mr.macro == :belongs_to
    end
  end
end
