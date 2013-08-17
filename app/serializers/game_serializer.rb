class GameSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :max_allowed_players, :number_of_lives, :created_at

  has_one :season
  has_many :predictions
  has_many :game_memberships
  has_many :game_invitations

end
