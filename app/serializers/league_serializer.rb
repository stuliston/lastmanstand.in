class LeagueSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :name

  has_many :seasons

end
