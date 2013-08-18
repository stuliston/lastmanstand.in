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

  isCurrentProfileOutOfLives: Ember.computed.lte('currentProfileRemainingLives', 0)

  #This is somewhat duplicated in game/membership_item_controller. Review later
  currentProfileKnockoutFixture: (->
    return if !@get('isCurrentProfileOutOfLives')
    lastRoundNumber = Math.max(@get('currentProfileIncorrectPredictions').mapProperty('fixture.round.number')...)
    @get('currentProfileIncorrectPredictions').findProperty('fixture.round.number', lastRoundNumber).get('fixture')
  ).property('isCurrentProfileOutOfLives')

  #This could be cleaned up a bit
  winner: (->

    return if @get('gameMemberships.length') == 1

    livesByProfileId = {}

    @get('predictions').forEach((prediction) ->
      if prediction.get('fixture.hasResult') && !prediction.get('isCorrect')
        id = prediction.get('profile.id')
        livesByProfileId[id] = (livesByProfileId[id] || 0) + 1
    )

    availableLives = @get('numberOfLives')
    currentProfileId = @get('currentProfile.id')
    profilesWithLives = []

    for profileId, lostLives of livesByProfileId
      if (lostLives < availableLives)
        profilesWithLives.push(LMS.Profile.find(profileId))

    if profilesWithLives.length == 1
      profilesWithLives[0]

  ).property('predictions.@each.team')

  currentProfileIsWinner: (->
    @get('winner') == @get('currentProfile')
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

