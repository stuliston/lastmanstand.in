LMS.GameRoundController = Ember.ObjectController.extend

  needs: ['application', 'game', 'gameRounds', 'predictions', 'currentProfile']
  predictions: null
  currentProfile: null
  predictionsBinding: 'controllers.predictions'
  currentProfileBinding: 'controllers.currentProfile.model'

  currentTime: (->
    @get('controllers.application.currentTime')
  ).property 'controllers.application.currentTime'

  isRoundClosed: (->
    @get('controllers.application.currentTime') > @get('startTime')
  ).property('startTime', 'currentTime')

  previousRound: (->
    previousRoundNumber = @get('number') - 1
    @get('controllers.gameRounds').findProperty('number', previousRoundNumber)
  ).property('controllers.gameRounds', 'model')

  nextRound: (->
    nextRoundNumber = @get('number') + 1
    @get('controllers.gameRounds').findProperty('number', nextRoundNumber)
  ).property('controllers.gameRounds', 'model')

  selectWinner: (fixture, team) ->
    game = @get('controllers.game.model')
    return unless @_isTeamSelectableForGame(team, game)

    if currentPrediction = @_predictionForGameAndRound()
      currentPrediction.setProperties(fixture: fixture, team: team)
    else
      LMS.Prediction.createRecord
        fixture: fixture,
        team: team,
        profile: @get('currentProfile'),
        game: game

    @get('store').commitDefaultTransaction()

  _isTeamSelectableForGame: (team, game) ->
    !(@get('isRoundClosed') || @get('predictions').some((prediction) ->
      prediction.get('team') == team && prediction.get('game') == game
    ))

  #Assumes that server prevents a round from having more than a single prediction
  #and will clean up if anything goes wrong. Currently not tying the prediction to
  #the round in order to make supporting a standard 'footy tipping' game style possible
  #at a later date.
  _predictionForGameAndRound: ->
    round = @get('model')
    game = @get('controllers.game.model')
    @get('predictions').find((prediction) -> prediction.get('fixture.round') == round && prediction.get('game') == game)

