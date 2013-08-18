module GamePredictionsResolver

  #Only return predictions for current user or closed rounds
  def predictions
    now = Time.now
    current_user = scope
    object.predictions.find_all do |prediction|
      prediction.user == current_user || prediction.fixture.round.start_time <= now
    end
  end

end