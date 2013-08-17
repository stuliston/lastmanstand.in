LMS.GameMembershipItemController = Ember.ObjectController.extend

  currentProfilePredictionsWithResult: (->
    profile = @get('profile')
    Ember.A(@get('game.predictions')).filter((prediction) ->
      prediction.get('profile') == profile && prediction.get('fixture.hasResult')
    )
  ).property('game.predictions.@each.team')

  correctPredictions: (->
    @get('currentProfilePredictionsWithResult').filter((prediction) ->
      prediction.get('isCorrect')
    )
  ).property('currentProfilePredictionsWithResult')

  incorrectPredictions: (->
    @get('currentProfilePredictionsWithResult').filter((prediction) ->
      !prediction.get('isCorrect')
    )
  ).property('currentProfilePredictionsWithResult')

  lostLives: (->
    @get('incorrectPredictions.length')
  ).property('incorrectPredictions.length')

  remainingLives: (->
    @get('game.numberOfLives') - @get('lostLives')
  ).property('lostLives')

  isOutOfLives: Ember.computed.lte('remainingLives', 0)

  knockoutFixture: (->
    return if !@get('isOutOfLives')
    lastRoundNumber = Math.max(@get('incorrectPredictions').mapProperty('fixture.round.number')...)
    @get('incorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('isOutOfLives')

