require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
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

  describe 'POST #create' do
    after(:all) { Player.delete_all }

    let!(:player) { FactoryGirl.attributes_for(:player) }

    context 'invalid form' do
      before { player.update(last_name: '') }
      it 'should render :new & flash :error' do
        post :create, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end

      before { player.update(first_name: '') }
      it 'should render :new & flash :error' do
        post :create, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end

      let!(:player) { FactoryGirl.attributes_for(:player, last_name: 'same_name', first_name: 'same_name') }
      it 'should render :new & flash :error' do
        post :create, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end
    end

    context 'valid form' do
      it 'should redirect to players path & flash :success' do
        post :create, player: player
        expect(response).to redirect_to Player.last
        flash[:error] == (/^Player created./)
      end
    end
  end

  describe 'PATCH #update' do
    after(:all) { Player.delete_all }

    let!(:player_created) { FactoryGirl.create(:player, id: 2) }
    let!(:player) { FactoryGirl.attributes_for(:player, id: 2) }

    context 'invalid form' do
      before { player.update(last_name: '') }
      it 'should render :new & flash :error' do
        patch :update, id: 2, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end

      before { player.update(first_name: '') }
      it 'should render :new & flash :error' do
        patch :update, id: 2, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end

      let!(:player) { FactoryGirl.attributes_for(:player, last_name: 'same_name', first_name: 'same_name', id: 2) }
      it 'should render :new & flash :error' do
        patch :update, id: 2, player: player
        expect(response).to render_template :new
        flash[:error] == (/^Problem with creating the Player./)
      end
    end

    context 'valid form' do
      it 'should redirect to players path & flash :success' do
        post :create, player: player
        expect(response).to redirect_to Player.last
        flash[:error] == (/^Player created./)
      end
    end
  end

  describe 'GET #new' do
    it 'should assigns @player to Player.new' do
      @player = Player.new
      get :new
      assigns(:player) == [:player]
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    after(:all) { Player.delete_all }

    let!(:player) { FactoryGirl.create(:player, id: 2) }

    it 'should assigns @player to current Player' do
      @player = Player.find(player.id)
      get :show, id: @player
      assigns(:player) == [:player]
    end

    it 'renders the index template' do
      @player = Player.find(player.id)
      get :show, id: @player
      expect(response).to render_template :show
    end
  end
end
