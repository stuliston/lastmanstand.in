class FixtureSerializer < ActiveModel::Serializer

  cached
  delegate :cache_key, to: :object

  # embed :ids, include: true
  attributes :id, :start_time, :home_score, :away_score, :draw

  has_one :round, embed: :ids, include: true
  has_one :home_team, embed: :ids, include: true, root: :teams
  has_one :away_team, embed: :ids, include: true, root: :teams
  has_one :winning_team, embed: :ids, include: true, root: :teams

end
