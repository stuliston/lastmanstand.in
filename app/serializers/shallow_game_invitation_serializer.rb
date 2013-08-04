class ShallowGameInvitationSerializer < ActiveModel::Serializer

  embed :ids, include: false

  attributes :id, :email

  has_one :game
  has_one :profile
  has_one :invited_by

end
