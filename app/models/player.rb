class Player < ActiveRecord::Base
  has_many :match_results
end
