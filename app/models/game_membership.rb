class GameMembership < ActiveRecord::Base
  belongs_to :profile
  belongs_to :game
end