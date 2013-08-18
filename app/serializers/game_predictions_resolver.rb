module GamePredictionsResolver

  #Only return predictions for current user or closed rounds
  def predictions
    now = Time.now
    current_profile = scope.profile
    object.predictions.find_all do |prediction|
      prediction.profile == current_profile || prediction.fixture.round.start_time <= now
    end
  end

end