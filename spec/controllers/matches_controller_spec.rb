require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  describe 'GET #new' do
    after(:all) { Match.delete_all; Player.delete_all }

    let!(:match) { FactoryGirl.create(:match, first_player: 1, second_player: 2) }
    let!(:player) { FactoryGirl.create(:player) }

    it 'assigns @match to new Match' do
      @match = Match.new
      get :new
      expect(assigns(:match)) == [match]
    end

    it 'assigns @players to all players' do
      @players = Player.all
      get :new
      expect(assigns(:players)) == [player]
    end

    it 'renders new_template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    after(:all) { Match.delete_all }

    let!(:match) { FactoryGirl.attributes_for(:match, first_player: 1, second_player: 2) }

    context 'valid form' do
      it 'redirects to match_results & flash :success' do
        post :create, match: match
        expect(response).to redirect_to match_results_path
        flash[:success] == (/^Match result./)
      end
    end

    context 'invalid form' do
      before { match.update(first_player: '', second_player: '')}
      it 'renders :new & flash :error' do
        post :create, match: match
        expect(response).to render_template :new
        flash[:error] == (/^Can't start the Match./)
      end
    end
  end
end
