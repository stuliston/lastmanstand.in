LMS.GameRoundController = Ember.ObjectController.extend

  needs: ['application', 'game', 'gameRounds', 'predictions', 'currentProfile']
  predictions: null
  currentProfile: null
  isCurrentProfileOutOfLives: null
  currentTime: null
  gameRounds: null
  game: null
  predictionsBinding: 'controllers.predictions'
  currentProfileBinding: 'controllers.currentProfile.model'
  isCurrentProfileOutOfLivesBinding: 'controllers.game.isCurrentProfileOutOfLives'
  currentTimeBinding: 'controllers.application.currentTime'
  gameRoundsBinding: 'controllers.gameRounds'
  gameBinding: 'controllers.game.model'

  isRoundClosed: (->
    @get('currentTime') > @get('startTime')
  ).property('startTime', 'currentTime')

  previousRound: (->
    previousRoundNumber = @get('number') - 1
    @get('gameRounds').findProperty('number', previousRoundNumber)
  ).property('gameRounds', 'model')

  nextRound: (->
    nextRoundNumber = @get('number') + 1
    @get('gameRounds').findProperty('number', nextRoundNumber)
  ).property('gameRounds', 'model')

  #This and accompanying methods need some work.
  selectWinner: (fixture, team) ->
    return if @get('isCurrentProfileOutOfLives')

    game = @get('game')
    store = @get('store')

    if @_isTeamSelectableForGame(team, game)
      if predictionToDelete = @_predictionForTeamInCurrentRound(team)
        store.deleteRecord(predictionToDelete)
        @_rollbackOnError(predictionToDelete)
        store.commitDefaultTransaction()
        return
      else if predictionToDelete = @_predictionForTeamInFutureRound(team)
        store.deleteRecord(predictionToDelete)
        @_rollbackOnError(predictionToDelete)

      if currentPrediction = @_predictionForGameAndRound()
        currentPrediction.setProperties(fixture: fixture, team: team)
        @_rollbackOnError(currentPrediction)
      else
        newPrediction = LMS.Prediction.createRecord
          fixture: fixture,
          team: team,
          profile: @get('currentProfile'),
          game: game
        @_rollbackOnError(newPrediction)

      store.commitDefaultTransaction()


  _isTeamSelectableForGame: (team, game) ->
    !(@get('isRoundClosed') || @get('predictions').some((prediction) ->
      prediction.get('fixture.round.startTime') < new Date() &&
      prediction.get('team') == team &&
      prediction.get('game') == game
    ))

  #Assumes that server prevents a round from having more than a single prediction
  #and will clean up if anything goes wrong. Currently not tying the prediction to
  #the round in order to make supporting a standard 'footy tipping' game style possible
  #at a later date.
  _predictionForGameAndRound: ->
    round = @get('model')
    game = @get('game')
    @get('predictions').find((prediction) -> prediction.get('fixture.round') == round && prediction.get('game') == game)


  _predictionForTeamInCurrentRound: (team) ->
    currentRound = @get('model')
    prediction = @get('predictions').find((prediction) =>
      (prediction.get('fixture.round') == currentRound) &&
      prediction.get('team') == team
    )

  _predictionForTeamInFutureRound: (team) ->
    currentRound = @get('model')
    prediction = @get('predictions').find((prediction) =>
      (prediction.get('fixture.round') != currentRound || prediction.get('fixture.round.startTime') > new Date()) &&
      prediction.get('team') == team
    )

  _rollbackOnError: (prediction) ->
    store = @get('store')
    revertState = prediction.get('stateManager.currentPath').replace('rootState.', '')
    prediction.one 'becameError', ->
      if @get('isError')
        @get('stateManager').transitionTo(revertState)
        @rollback()
