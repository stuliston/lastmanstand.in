class GameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id

  has_one :game
  has_one :profile, serializer: ShallowProfileSerializer

end