class GameInvitationSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :email, :avatar_image_url

  has_one :game
  has_one :profile, serializer: ShallowProfileSerializer
  has_one :invited_by, serializer: ShallowProfileSerializer, root: :profiles

  def avatar_image_url
    id = Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
    "http://www.gravatar.com/avatar/#{id}"
  end

end
