class GameSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name

  has_many :game_memberships, embed_key: :id
end
