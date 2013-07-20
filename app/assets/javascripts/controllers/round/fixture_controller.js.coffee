LMS.RoundFixtureController = Ember.ObjectController.extend

  needs: ['predictions', 'game']

  #This method has had some performance tuning done on it as it's called A LOT. 
  #Be sure to profile any changes before and after.
  selectedTeam: (->
    game = @get('controllers.game.model')
    fixture = @get('model')
    prediction = @get('controllers.predictions.byGame')[game]?.find((prediction) =>
      prediction.get('fixture') == fixture
    )
    prediction?.get('team')
  ).property('controllers.predictions.@each.team')

  selectedTeamClass: (->
    if @get('selectedTeam') == @get('homeTeam')
      'home-selected'
    else if @get('selectedTeam') == @get('awayTeam')
      'away-selected'
    else
      null
  ).property('selectedTeam')

  disableHomeTeam: (->
    return if @get('round.startTime') < new Date()
    game = @get('controllers.game.model')
    homeTeam = @get('homeTeam')
    @get('controllers.predictions.byGame')[game]?.some((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == homeTeam
    )
  ).property('controllers.predictions.@each.team')

  disableAwayTeam: (->
    return if @get('round.startTime') < new Date()
    game = @get('controllers.game.model')
    awayTeam = @get('awayTeam')
    @get('controllers.predictions.byGame')[game]?.some((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == awayTeam
    )
  ).property('controllers.predictions.@each.team')

  selectionClass: (->
    return unless @get('selectedTeam') && @get('winningTeam')
    if @get('selectedTeam') == @get('winningTeam')
      "correct"
    else  
      "incorrect"
  ).property('selectedTeam', 'winningTeam')

  resultClass: (->
    return unless @get('winningTeam')
    if @get('winningTeam') == @get('homeTeam')
      "home-win away-lose"
    else  
      "home-lose away-win"
  ).property('selectedTeam', 'winningTeam')

  
