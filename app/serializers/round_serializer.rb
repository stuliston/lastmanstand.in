class RoundSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :number, :start_time

  has_one :season
  has_many :fixtures

end
