class ShallowGameInvitationSerializer < ActiveModel::Serializer

  embed :ids

  attributes :id, :email

  has_one :profile, include: true, serializer: ShallowProfileSerializer, root: :profiles
  has_one :game, include: true, serializer: VeryShallowGameSerializer
  has_one :invited_by, include: true, serializer: ShallowProfileSerializer, root: :profiles

end
