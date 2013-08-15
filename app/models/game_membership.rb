class GameMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  after_create do |game_membership|
    invitations = GameInvitation.where(game: game_membership.game, user: game_membership.user)
    invitations.each { |invitation| invitation.destroy }
  end

  def update_lives!
    incorrect_predictions = game.predictions.where(user: user).find_all do |prediction|
      prediction.has_result? && !prediction.correct?
    end
    self.lost_lives = incorrect_predictions.size
    save!
  end
end