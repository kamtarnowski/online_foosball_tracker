class ApplicationController < ActionController::Base
  before_action :set_cache_buster
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include PlayersHelper
  include MatchesHelper
  include ClassificationsHelper

  def set_cache_buster
    response.headers["Cache-Control"] = "no-store"
  end
end
