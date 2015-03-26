class MatchResult < ActiveRecord::Base
  belongs_to :player, :dependent => :delete
  belongs_to :match, :dependent => :delete
end
