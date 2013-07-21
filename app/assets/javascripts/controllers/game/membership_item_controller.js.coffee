LMS.GameMembershipItemController = Ember.ObjectController.extend

  incorrectPredictions: (->
    game = @get('game')
    @get('profile.predictions').filter((prediction) ->
      prediction.get('game') == game && !prediction.get('isCorrect')
    )
  ).property('profile.predictions.@each.team')

  remainingLives: (->
    @get('game.numberOfLives') - @get('incorrectPredictions').get('length')
  ).property('incorrectPredictions')

  isOutOfLives: (->
    @get('remainingLives') <= 0
  ).property('remainingLives')

  knockoutFixture: (->
    return if !@get('isOutOfLives')
    lastRoundNumber = Math.max(@get('incorrectPredictions').mapProperty('fixture.round.number')...)
    @get('incorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('isOutOfLives')
