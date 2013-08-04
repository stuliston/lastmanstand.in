class VeryShallowGameSerializer < ActiveModel::Serializer

  embed :ids, include: false
  attributes :id, :name, :max_allowed_players, :number_of_lives

  has_many :game_invitations

end
