class TeamSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :name, :abbreviated_name

end
