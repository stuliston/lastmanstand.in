class GameSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :max_allowed_players

  has_many :game_memberships
  has_many :game_invitations


end
