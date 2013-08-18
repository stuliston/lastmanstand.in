class GameMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  after_create do |game_membership|
    invitations = GameInvitation.where(game: game_membership.game, user: game_membership.user)
    invitations.each { |invitation| invitation.destroy }
  end
end