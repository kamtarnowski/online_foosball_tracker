require 'rails_helper'

RSpec.describe Match, type: :model do
  after(:all) { Match.delete_all }

  let!(:match) { FactoryGirl.create(:match, first_player: 1, second_player: 2) }

  subject { match }

  it { should respond_to(:first_player) }
  it { should respond_to(:second_player) }

  describe 'validation of data' do
    context 'with presence of first & second player' do
      it { should be_valid }
    end

    context 'without presence of first & second player' do
      before { match.first_player = ''; match.second_player = '' }
      it { should be_invalid }
    end
  end

  describe 'associations in the Model' do
    it 'should have many match_results' do
      mr = Match.reflect_on_association(:match_results)
      mr.macro == :has_many
    end
  end
end