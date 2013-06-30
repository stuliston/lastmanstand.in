LMS.GameRoundController = Ember.ObjectController.extend

  needs: ['application', 'game', 'predictions', 'currentProfile']
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
    rounds = @get('season.rounds')
    currentRoundIndex = rounds.indexOf(@get('model'))
    rounds.objectAt(currentRoundIndex - 1) if currentRoundIndex
  ).property('model')

  nextRound: (->
    rounds = @get('season.rounds')
    currentRoundIndex = rounds.indexOf(@get('model'))
    rounds.objectAt(currentRoundIndex + 1) if currentRoundIndex >= 0
  ).property('model')

  selectWinner: (fixture, team) ->
    return if @get('isRoundClosed') || @get('predictions').someProperty('team', team)

    if prediction = @_predictionForRound()
      prediction.setProperties(fixture: fixture, team: team)
      fixture.get('currentUserPredictions').pushObject(prediction)
    else
      prediction = LMS.Prediction.createRecord(fixture: fixture, team: team, profile: @get('currentProfile'))

    @get('store').commit()

  #Assumes that server prevents a round from having more than a single prediction
  #and will clean up if anything goes wrong. Currently not tying the prediction to
  #the round in order to make supporting a standard 'footy tipping' game style possible
  #at a later date.
  _predictionForRound: ->
    round = @get('model')
    @get('predictions').find((prediction) -> prediction.get('fixture.round') == round )

