class Team < ActiveRecord::Base
  belongs_to :league
  has_many :home_fixtures, class_name: 'Fixture', foreign_key: :home_team_id
  has_many :away_fixtures, class_name: 'Fixture', foreign_key: :away_team_id

  validates :name, presence: true
  validates :league, presence: true

end
