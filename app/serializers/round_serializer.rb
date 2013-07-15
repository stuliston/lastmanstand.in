class RoundSerializer < ActiveModel::Serializer

  embed :ids, include: true
  attributes :id, :number, :start_time

  has_one :season
  has_many :fixtures

  #This could be stored and maintained by after save hooks on fixtures if performance is a concern
  def start_time
    fixtures.map(&:start_time).min
  end

end
