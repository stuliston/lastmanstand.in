class TeamSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :name

end
