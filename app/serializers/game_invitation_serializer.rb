class GameInvitationSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id

  has_one :game
  has_one :profile

end
