class ShallowUserSerializer < ActiveModel::Serializer

  embed :ids#, include: true

  attributes :id, :avatar_image_url, :name, :email

  has_many :game_memberships
  has_many :game_invitations
  has_many :predictions

  def avatar_image_url
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
  end
end
