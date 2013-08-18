class ShallowGameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: false

  attributes :id

  has_one :game
  has_one :user

end