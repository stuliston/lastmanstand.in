class RoundSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :number

  has_one :season
  has_many :fixtures

end
