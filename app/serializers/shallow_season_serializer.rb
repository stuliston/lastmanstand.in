class ShallowSeasonSerializer < ActiveModel::Serializer

  embed :ids, include: false
  attributes :id, :name

  has_one :competition
  has_many :rounds

end
