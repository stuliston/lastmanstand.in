class ShallowGameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id

  has_one :game#, serializer: ShallowGameSerializer
  has_one :profile, serializer: ShallowProfileSerializer

end
