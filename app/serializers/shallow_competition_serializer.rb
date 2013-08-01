class ShallowCompetitionSerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :seasons, embed: :ids, include: true
  has_one :current_season, embed: :ids

end
