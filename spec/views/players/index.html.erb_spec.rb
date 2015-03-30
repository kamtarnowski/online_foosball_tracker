require 'rails_helper'

RSpec.describe "players/index.html.erb", type: :view do
  after(:all) { Player.delete_all }

  let!(:player) { FactoryGirl.create(:player) }

  context 'view with only one player or less' do
    it 'should render only two table rows ("th" + "td")' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to have_selector('tr', count: 2)
    end

    it 'should contain Player attributes' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to have_content(player.last_name)
      expect(rendered).to have_content(player.first_name)
      expect(rendered).to have_selector('a', player.avatar.url)
      expect(rendered).to have_selector('img', player.avatar.url(:thumb))
    end

    it 'should not have Create Match button' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to_not have_link 'Create a New Match', matches_new_path
    end
  end

  context 'view with many players' do
    after(:all) { Player.delete_all }
    before(:all) { 5.times { FactoryGirl.create(:player) }}

    let!(:player) { FactoryGirl.create(:player) }

    it 'should render table rows ("th" + 6x"td")' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to have_selector('tr', count: 7)
    end

    it 'should contain Player attributes' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to have_content(player.last_name)
      expect(rendered).to have_content(player.first_name)
      expect(rendered).to have_selector('a', player.avatar.url)
      expect(rendered).to have_selector('img', player.avatar.url(:thumb))
    end

    it 'should have Create Match button' do
      @players = Player.order(:created_at => :desc).page(params[:page]).per(20)
      render
      expect(rendered).to have_link 'Create a New Match', matches_new_path
    end
  end
end
