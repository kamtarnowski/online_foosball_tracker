class Match < ActiveRecord::Base
  has_many :match_results
  validates :first_player, presence: true
  validates :second_player, presence: true
end
