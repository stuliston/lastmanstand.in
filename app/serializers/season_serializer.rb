class SeasonSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :name

  has_one :league

end
