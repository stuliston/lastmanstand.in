class GameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :lost_lives

  has_one :game
  has_one :profile, serializer: ShallowProfileSerializer

end