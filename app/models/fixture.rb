class Fixture < ActiveRecord::Base

  belongs_to :round
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :winning_team, class_name: 'Team', foreign_key: 'winning_team_id'

  has_many :predictions

  default_scope -> { order('start_time') }

end
