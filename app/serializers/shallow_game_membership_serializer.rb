class ShallowGameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: false

  attributes :id, :lost_lives

  has_one :game
  has_one :user

end