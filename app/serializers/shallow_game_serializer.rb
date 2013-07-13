class ShallowGameSerializer < ActiveModel::Serializer
  # embed :ids, include: true
  attributes :id, :name, :max_allowed_players

  has_one :season

end
