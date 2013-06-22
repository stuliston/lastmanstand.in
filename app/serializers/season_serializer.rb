class SeasonSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :name

  has_one :league
  has_many :rounds

end
