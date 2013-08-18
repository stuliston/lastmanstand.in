LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    currentProfile = @modelFor('application').get('currentProfile')
    currentGames = currentProfile.get('gameMemberships').mapProperty('game')

    isIos = @controllerFor('application').get('isIos')

    return if isIos && !navigator.standalone

    if currentProfile.get('gameInvitations.length')
      @transitionTo 'game_invitations'
    else if game = @controllerFor('game').lastGame() || currentGames.get('firstObject')
      @transitionTo 'game.round', game, game.get('currentRound')
    else
      @transitionTo 'games.new'



