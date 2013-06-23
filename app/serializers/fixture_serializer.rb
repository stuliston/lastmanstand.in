class FixtureSerializer < ActiveModel::Serializer

  # embed :ids, include: true
  attributes :id, :start_time

  has_one :round
  has_one :home_team, embed: :ids, include: true, root: :teams
  has_one :away_team, embed: :ids, include: true, root: :teams
  has_one :winning_team, embed: :ids, include: true, root: :teams

  has_many :current_user_predictions, embed: :ids

  #returning an array so client won't try to send it back
  def current_user_predictions
    Prediction.where(profile: current_user.profile, fixture: object)
  end

end
