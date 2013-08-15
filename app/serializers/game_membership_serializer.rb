class GameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :lost_lives

  has_one :game
  has_one :user, serializer: ShallowUserSerializer

end