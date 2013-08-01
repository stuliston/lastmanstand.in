class SeasonSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :name

  has_one :competition
  has_many :rounds

end
