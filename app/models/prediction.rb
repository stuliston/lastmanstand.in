#Currently not tying a prediction to a round (even though only one is allowed per round for LMS mode)
#so we can support standard footy tipping games (AFL Style) later without a model change
class Prediction < ActiveRecord::Base

  belongs_to :fixture
  belongs_to :user
  belongs_to :team
  belongs_to :game

  def correct?
    team == fixture.winning_team
  end

  def has_result?
    fixture.has_result?
  end

end