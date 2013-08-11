LMS.GameMembershipItemController = Ember.ObjectController.extend

  incorrectPredictions: (->
    profile = @get('profile')
    @get('game.predictions').filter((prediction) ->
      prediction.get('profile') == profile && prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
    )
  ).property('game.predictions.@each.team')

  lostLives: (->
    @get('incorrectPredictions').get('length')
  ).property('incorrectPredictions')

  remainingLives: (->
    @get('game.numberOfLives') - @get('lostLives')
  ).property('lostLives')

  isOutOfLives: (->
    @get('remainingLives') <= 0
  ).property('remainingLives')

  knockoutFixture: (->
    return if !@get('isOutOfLives')
    lastRoundNumber = Math.max(@get('incorrectPredictions').mapProperty('fixture.round.number')...)
    @get('incorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('isOutOfLives')

