class PredictionSerializer < ActiveModel::Serializer

  # cached
  # delegate :cache_key, to: :object

  embed :ids#, include: true
  attributes :id

  has_one :user
  has_one :team
  has_one :fixture
  has_one :game

end
