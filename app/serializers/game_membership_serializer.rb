class GameMembershipSerializer < ActiveModel::Serializer
  attributes :id, :avatar_image_url

  def avatar_image_url
    'poop'
  end
end
