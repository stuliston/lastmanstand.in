class TeamSerializer < ActiveModel::Serializer

  cached
  delegate :cache_key, to: :object

  embed :ids, include: true

  attributes :id, :name, :abbreviated_name

end
