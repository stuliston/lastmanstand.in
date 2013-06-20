class FixtureSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id

  has_one :round
  has_one :home_team
  has_one :away_team
  has_one :winning_team

end
