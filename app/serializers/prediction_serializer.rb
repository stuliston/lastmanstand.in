class PredictionSerializer < ActiveModel::Serializer

  embed :ids#, include: true
  attributes :id

  has_one :profile
  has_one :team
  has_one :fixture
  has_one :game

end
