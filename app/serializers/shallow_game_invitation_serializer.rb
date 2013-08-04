class ShallowGameInvitationSerializer < ActiveModel::Serializer

  embed :ids

  attributes :id, :email, :avatar_image_url

  has_one :profile, include: true, serializer: ShallowProfileSerializer, root: :profiles
  has_one :game, include: true, serializer: VeryShallowGameSerializer
  has_one :invited_by, include: true, serializer: ShallowProfileSerializer, root: :profiles

  def avatar_image_url
    id = Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
    "http://www.gravatar.com/avatar/#{id}"
  end

end
