LMS.RoundFixtureController = Ember.ObjectController.extend

  needs: ['predictions', 'gamePredictions', 'game']
  game: null
  predictions: null
  gamePredictions: null
  isCurrentUserOutOfLives: null
  gameBinding: 'controllers.game.model'
  predictionsBinding: 'controllers.predictions'
  gamePredictionsBinding: 'controllers.gamePredictions'
  isCurrentUserOutOfLivesBinding: 'controllers.game.isCurrentUserOutOfLives'

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

  selectedTeamClass: (->
    if @get('selectedTeam') == @get('homeTeam')
      'home-selected'
    else if @get('selectedTeam') == @get('awayTeam')
      'away-selected'
    else
      null
  ).property('selectedTeam')

  disableHomeTeam: (->
    return true if @get('isCurrentUserOutOfLives')
    return false if @get('round.startTime') < new Date()
    game = @get('game')
    homeTeam = @get('homeTeam')
    @get('predictions.byGame')[game]?.some((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == homeTeam
    )
  ).property('predictions.@each.team', 'game', 'isCurrentUserOutOfLives')

  disableAwayTeam: (->
    return true if @get('isCurrentUserOutOfLives')
    return false if @get('round.startTime') < new Date()
    game = @get('game')
    awayTeam = @get('awayTeam')
    @get('predictions.byGame')[game]?.some((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == awayTeam
    )
  ).property('predictions.@each.team', 'game', 'isCurrentUserOutOfLives')

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


