class Fixture < ActiveRecord::Base

  belongs_to :round
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :winning_team, class_name: 'Team', foreign_key: 'winning_team_id'

  has_many :predictions

  after_save do |fixture|
    update_lives!
  end

  def update_lives!
    game_memberships.each {|game_membership| game_membership.update_lives! }
  end

  def game_memberships
    game_ids = predictions.map(&:game_id)
    GameMembership.where(game_id: game_ids)
  end

end
