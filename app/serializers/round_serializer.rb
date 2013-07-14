class RoundSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :number, :start_time

  has_one :season
  has_many :fixtures

  def start_time
    fixtures.map(&:start_time).min
  end

end
