class ProfileSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :avatar_image_url, :name

  has_many :game_memberships
  has_many :game_invitations

  def avatar_image_url
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(object.user.email.to_s.strip.downcase)
  end
end
