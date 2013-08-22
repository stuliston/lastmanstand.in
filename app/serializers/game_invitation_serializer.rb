class GameInvitationSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :email, :avatar_image_url

  has_one :game
  has_one :user, serializer: ShallowUserSerializer
  has_one :invited_by, serializer: ShallowUserSerializer, root: :users

  def avatar_image_url
    id = Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
    "http://www.gravatar.com/avatar/#{id}"
  end

end
