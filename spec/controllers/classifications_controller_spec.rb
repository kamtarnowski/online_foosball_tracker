require 'rails_helper'

RSpec.describe ClassificationsController, type: :controller do
  describe 'GET #index' do
    it 'should assigns @players to Player.all' do
      @players = Player.all

      get :index

      assigns(:players) == [:player]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end
end
