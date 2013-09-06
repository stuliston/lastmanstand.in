LMS.GameController = Ember.ObjectController.extend

  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser.model')

  currentUserIncorrectPredictions: (->
    user = @get('currentUser')
    @get('predictions').filter((prediction) ->
      prediction.get('user') == user && prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
    )
  ).property('predictions.@each.team')

  currentUserRemainingLives: (->
    @get('numberOfLives') - @get('gameMemberships').findProperty('user', @get('currentUser')).get('lostLives')
  ).property('numberOfLives', 'gameMemberships.@each.lostLives')

  currentUserLostLives: (->
    @get('numberOfLives') - @get('currentUserRemainingLives')
  ).property('currentUserRemainingLives')

  isCurrentUserOutOfLives: Ember.computed.lte('currentUserRemainingLives', 0)

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentUserKnockoutFixture: (->
    return if !@get('isCurrentUserOutOfLives')
    predictionRoundNumbers = @get('currentUserIncorrectPredictions').mapProperty('fixture.round.number')
    if predictionRoundNumbers.length
      lastRoundNumber = Math.max(predictionRoundNumbers...)
      @get('currentUserIncorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('isCurrentUserOutOfLives')

  #This could be cleaned up a bit
  winner: (->

    return if @get('gameMemberships.length') == 1

    livesByUserId = {}

    @get('predictions').forEach((prediction) ->
      if prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
        id = prediction.get('user.id')
        livesByUserId[id] = (livesByUserId[id] || 0) + 1
    )

    availableLives = @get('numberOfLives')
    currentUserId = @get('currentUser.id')
    usersWithLives = []

    for userId, lostLives of livesByUserId
      if (lostLives < availableLives)
        usersWithLives.push(LMS.User.find(userId))

    if usersWithLives.length == 1
      usersWithLives[0]

  ).property('predictions.@each.team')

  currentUserIsWinner: (->
    @get('winner') == @get('currentUser')
  ).property('winner')

  modelDidChange: (->
    game = @get('model')
    if game
      localStorage.setItem 'lastGameId', game.get('id')
  ).observes('model')

  lastGame: ->
    if id = localStorage.getItem 'lastGameId'
      #don't us a find by id. Only look for previously loaded games in case the game no longer exists
      LMS.Game.all().findProperty(id)

