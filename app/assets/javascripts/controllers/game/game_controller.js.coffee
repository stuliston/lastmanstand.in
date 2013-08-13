LMS.GameController = Ember.ObjectController.extend

  needs: ['currentProfile']
  currentProfile: null
  currentProfileBinding: 'controllers.currentProfile.model'

  currentProfileIncorrectPredictions: (->
    profile = @get('currentProfile')
    @get('predictions').filter((prediction) ->
      prediction.get('profile') == profile && prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
    )
  ).property('predictions.@each.team')

  currentProfileRemainingLives: (->
    @get('numberOfLives') - @get('currentProfileIncorrectPredictions.length')
  ).property('numberOfLives', 'currentProfileIncorrectPredictions.length')

  currentProfileIsOutOfLives: Ember.computed.lte('currentProfileRemainingLives', 0)

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileKnockoutFixture: (->
    return if !@get('currentProfileIsOutOfLives')
    lastRoundNumber = Math.max(@get('currentProfileIncorrectPredictions').mapProperty('fixture.round.number')...)
    @get('currentProfileIncorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('currentProfileIsOutOfLives')

  #This could be cleaned up a bit
  currentProfileIsWinner: (->
    return false if @get('currentProfileIsOutOfLives')

    livesByProfileId = {}

    @get('predictions').forEach((prediction) ->
      if prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
        id = prediction.get('profile.id')
        livesByProfileId[id] = livesByProfileId[id] + 1
    )

    isWinner = true
    availableLives = @get('numberOfLives')

    for profileId, lostLives of livesByProfileId
      if lostLives < availableLives
        isWinner = false
        break

    isWinner

  ).property('predictions.@each.team')

  modelDidChange: (->
    game = @get('model')
    if game
      localStorage.setItem 'lastGameId', game.get('id')
  ).observes('model')

  lastGame: ->
    if id = localStorage.getItem 'lastGameId'
      #don't us a find by id. Only look for previously loaded games in case the game no longer exists
      LMS.Game.all().findProperty(id)

