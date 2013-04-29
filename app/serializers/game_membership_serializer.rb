class GameMembershipSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :avatar_image_url

  has_one :game
  has_one :profile

  def avatar_image_url
    'poop'
  end
end
