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

  isHomeTeamSelected: (->
    @get('selectedTeam') == @get('homeTeam')
  ).property('selectedTeam')

  isAwayTeamSelected: (->
    @get('selectedTeam') == @get('awayTeam')
  ).property('selectedTeam')

  disableHomeTeam: (->
    game = @get('controllers.game.model')
    homeTeam = @get('homeTeam')
    @get('controllers.predictions.byGame')[game]?.some((prediction) =>
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == homeTeam
    )
  ).property('controllers.predictions.@each.team')

  disableAwayTeam: (->
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

  homeOrAway: (->
    if @get('isHomeTeamSelected')
      'home'
    else if @get('isAwayTeamSelected')
      'away'
    else
      null
  ).property('isHomeTeamSelected', 'isAwayTeamSelected')
