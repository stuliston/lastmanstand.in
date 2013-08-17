class GameMembership < ActiveRecord::Base
  belongs_to :profile
  belongs_to :game

  after_create do |game_membership|
    invitations = GameInvitation.where(game: game_membership.game, profile: game_membership.profile)
    invitations.each { |invitation| invitation.destroy }
  end
end