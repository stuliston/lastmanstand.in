class Fixture < ActiveRecord::Base
  blongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  blongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  blongs_to :winning_team, class_name: 'Team', foreign_key: 'winning_team_id'
end
