class CompetitionSerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :seasons, embed: :ids, include: true, serializer: ShallowSeasonSerializer
  has_one :current_season, embed: :ids

end