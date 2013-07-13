class ShallowGameInvitationSerializer < ActiveModel::Serializer

  attributes :id

  has_one :game, embed: :idsa
  has_one :profile, embed: :ids, include: true, serializer: ShallowProfileSerializer

end
