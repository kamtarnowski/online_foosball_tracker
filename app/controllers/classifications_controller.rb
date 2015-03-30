class ClassificationsController < ApplicationController
  def index
    update_places
    @players = Player.order(:place).page(params[:page]).per(20)
  end
end
