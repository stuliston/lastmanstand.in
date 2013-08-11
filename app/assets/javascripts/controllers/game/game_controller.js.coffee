LMS.GameController = Ember.ObjectController.extend

  needs: ['currentProfile']
  currentProfile: null
  currentProfileBinding: 'controllers.currentProfile.model'

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileIncorrectPredictions: (->
    profile = @get('currentProfile')
    @get('predictions').filter((prediction) ->
      prediction.get('profile') == profile && prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
    )
  ).property('predictions.@each.team')

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileLostLives: (->
    @get('currentProfileIncorrectPredictions').get('length')
  ).property('currentProfileIncorrectPredictions')

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileRemainingLives: (->
    @get('numberOfLives') - @get('currentProfileLostLives')
  ).property('lostLives')

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileIsOutOfLives: (->
    @get('currentProfileRemainingLives') <= 0
  ).property('currentProfileRemainingLives')

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileKnockoutFixture: (->
    return if !@get('currentProfileIsOutOfLives')
    lastRoundNumber = Math.max(@get('currentProfileIncorrectPredictions').mapProperty('fixture.round.number')...)
    @get('currentProfileIncorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('currentProfileIsOutOfLives')

  #This could be cleaned up a bit
  currentProfileIsWinner: (->
    return false if @get('currentProfileIsOutOfLives')

    lostLives = {}
    availableLives = @get('numberOfLives')

    @get('predictions').forEach((prediction) ->
      if prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
        id = prediction.get('profile.id')
        lostLives[id] = lostLives[id] + 1
    )

    isWinner = true

    for k, v of lostLives
      if v < availableLives
        isWinner = false
        break

    isWinner

  ).property('currentProfileIsOutOfLives', 'predictions.@each.team')

  modelDidChange: (->
    game = @get('model')
    if game
      localStorage.setItem 'lastGameId', game.get('id')
  ).observes('model')

  lastGame: ->
    if id = localStorage.getItem 'lastGameId'
      #don't us a find by id. Only look for previously loaded games in case the game no longer exists
      LMS.Game.all().findProperty(id)

