class ShallowGameSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :max_allowed_players, :number_of_lives

  has_one :season

end
