LMS.RoundFixtureController = Ember.ObjectController.extend

  needs: ['predictions', 'gamePredictions', 'game']
  game: Ember.computed.alias('controllers.game.model')
  predictions: Ember.computed.alias('controllers.predictions')
  gamePredictions: Ember.computed.alias('controllers.gamePredictions')
  isCurrentUserOutOfLives: Ember.computed.alias('controllers.game.isCurrentUserOutOfLives')

  #This method has had some performance tuning done on it as it's called A LOT.
  #Be sure to profile any changes before and after.
  selectedTeam: (->
    game = @get('game')
    fixture = @get('model')
    prediction = @get('predictions.byGame')[game]?.find((prediction) =>
      prediction.get('fixture') == fixture
    )
    prediction?.get('team')
  ).property('predictions.@each.team', 'game')

  isHomeSelected: (->
    @get('selectedTeam') == @get('homeTeam')
  ).property('selectedTeam')

  isAwaySelected: (->
    @get('selectedTeam') == @get('awayTeam')
  ).property('selectedTeam')

  selectedTeamClass: (->
    if @get('selectedTeam') == @get('homeTeam')
      'home-selected'
    else if @get('selectedTeam') == @get('awayTeam')
      'away-selected'
    else
      null
  ).property('selectedTeam')

  isFutureRound: (->
    @get('round.startTime') > new Date()
  ).property('round.startTime')

  previousHomeTeamPrediction: (->
    game = @get('game')
    team = @get('homeTeam')
    @get('predictions.byGame')[game]?.find((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == team
    )
  ).property('predictions.@each.team', 'game')

  previousHomeTeamPredictionOtherTeam: (->
    team = @get('homeTeam')
    prediction = @get('previousHomeTeamPrediction')
    if team == prediction.get('fixture.homeTeam')
      prediction.get('fixture.awayTeam')
    else
      prediction.get('fixture.homeTeam')
  ).property('previousHomeTeamPrediction')

  previousAwayTeamPrediction: (->
    game = @get('game')
    team = @get('awayTeam')
    @get('predictions.byGame')[game]?.find((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == team
    )
  ).property('predictions.@each.team', 'game')

  previousAwayTeamPredictionOtherTeam: (->
    team = @get('awayTeam')
    prediction = @get('previousAwayTeamPrediction')
    if team == prediction.get('fixture.awayTeam')
      prediction.get('fixture.homeTeam')
    else
      prediction.get('fixture.awayTeam')
  ).property('previousHomeTeamPrediction')

  disableHomeTeam: (->
    return true if @get('isCurrentUserOutOfLives')
    return false if @get('round.startTime') < new Date()
    !!@get('previousHomeTeamPrediction')
  ).property('previousHomeTeamPrediction', 'isCurrentUserOutOfLives')

  disableAwayTeam: (->
    return true if @get('isCurrentUserOutOfLives')
    return false if @get('round.startTime') < new Date()
    !!@get('previousAwayTeamPrediction')
  ).property('previousAwayTeamPrediction', 'isCurrentUserOutOfLives')

  selectionClass: (->
    return unless @get('selectedTeam') && @get('winningTeam')
    if @get('selectedTeam') == @get('winningTeam')
      "correct"
    else
      "incorrect"
  ).property('selectedTeam', 'winningTeam')

  homeTeamPredictions: (->
    return [] if @get('round.startTime') > new Date()
    @get('gamePredictions.byFixture')[@get('model')]?.filterProperty('team', @get('homeTeam')) || []
  ).property('gamePredictions.@each.team')

  awayTeamPredictions: (->
    return [] if @get('round.startTime') > new Date()
    @get('gamePredictions.byFixture')[@get('model')]?.filterProperty('team', @get('awayTeam')) || []
  ).property('gamePredictions.@each.team')

  resultClass: (->
    return unless @get('winningTeam')
    if @get('winningTeam') == @get('homeTeam')
      "home-win away-lose"
    else
      "home-lose away-win"
  ).property('selectedTeam', 'winningTeam')


