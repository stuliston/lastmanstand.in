class GameInvitationSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :email

  has_one :game
  has_one :profile, serializer: ShallowProfileSerializer

end
