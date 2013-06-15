class Game < ActiveRecord::Base

  belongs_to :league
  has_many :game_memberships, dependent: :destroy
  has_many :game_invitations, dependent: :destroy
  has_many :profiles, through: :game_memberships

  def max_allowed_players
    3 #will be governed by payments later on
  end

end
