require 'rails_helper'

RSpec.describe Player, type: :model do
  after(:all) { Player.delete_all }
  let!(:player) { FactoryGirl.create(:player) }

  subject { player }

  it { should respond_to(:last_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:avatar) }
  it { should respond_to(:name) }
  it { should respond_to(:place) }
  it { should respond_to(:chances) }
  it { should respond_to(:slug) }

  describe 'validation of data' do
    context 'with presence of last_name, first_name, avatar' do
      it { should be_valid }
    end

    context 'without presence of last_name' do
      before { player.last_name = '' }
      it { should be_invalid }
    end

    context 'without presence of first_name' do
      before { player.first_name = '' }
      it { should be_invalid }
    end
  end

  describe 'associations in the Model' do
    it 'should have many match_results' do
    mr = Player.reflect_on_association(:match_results)
    mr.macro == :has_many
    end
  end
end
