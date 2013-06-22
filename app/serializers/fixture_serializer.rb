class FixtureSerializer < ActiveModel::Serializer

  # embed :ids, include: true
  attributes :id

  has_one :round
  has_one :home_team, embed: :ids, include: true, root: :teams
  has_one :away_team, embed: :ids, include: true, root: :teams
  has_one :winning_team, embed: :ids, include: true, root: :teams

end
