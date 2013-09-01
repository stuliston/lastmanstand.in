LMS.GameRoundController = Ember.ObjectController.extend

  needs: ['application', 'game', 'predictions', 'currentUser']
  rounds: null
  predictions: Ember.computed.alias('controllers.predictions')
  currentUser: Ember.computed.alias('controllers.currentUser.model')
  isCurrentUserOutOfLives: Ember.computed.alias('controllers.game.isCurrentUserOutOfLives')
  currentTime: Ember.computed.alias('controllers.application.currentTime')
  game: Ember.computed.alias('controllers.game.model')

  init: ->
    @_super()
    @_pollForRoundClose()

  isRoundClosed: (->
    @get('currentTime') > @get('startTime')
  ).property('startTime', 'currentTime')

  previousRound: (->
    previousRoundNumber = @get('number') - 1
    @get('rounds').findProperty('number', previousRoundNumber)
  ).property('rounds', 'model')

  nextRound: (->
    nextRoundNumber = @get('number') + 1
    @get('rounds').findProperty('number', nextRoundNumber)
  ).property('rounds', 'model')

  roundPredictions: (->
    round = @get('model')
    @get('game.predictions').filter (prediction) -> prediction.get('fixture.round') == round
  ).property('predictions.@each.fixture', 'model')


  actions:
    #This and accompanying methods need some work.
    selectWinner: (fixture, team) ->
      return if @get('isCurrentUserOutOfLives')

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
            user: @get('currentUser'),
            game: game
          @_rollbackOnError(newPrediction)

        store.commitDefaultTransaction()

        @get('analytics').trackEvent
          category: 'action'
          action: 'prediction'
          label: "#{game.get('name')} - Round #{fixture.get('round.number')}"
          value: team.get('name')



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

  _pollForRoundClose: ->
    @_roundClosePollId = setInterval(=>
      Ember.run =>
        if @get('startTime') < new Date() && @get('roundPredictions.length') == 1 && !@get('controllers.game.winner')
          @get('game').reload() #Simplest to just get the whole game for now.
    , 60000)

  destroy: ->
    clearInterval(@_roundClosePollId)
