class Game < ActiveRecord::Base
  has_many :game_memberships, dependent: :destroy
  has_many :game_invitations, dependent: :destroy
  has_many :profiles, through: :game_memberships
end
