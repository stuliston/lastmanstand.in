LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    currentUser = @controllerFor('currentUser').get('model')
    if !currentUser
      @transitionTo 'sessions.new'
    else
      currentGames = currentUser.get('gameMemberships').mapProperty('game')

      isIos = @controllerFor('application').get('isIos')

      return if isIos && !navigator.standalone

      if currentUser.get('gameInvitations.length')
        @transitionTo 'game_invitations'
      else if game = @controllerFor('game').lastGame() || currentGames.get('firstObject')
        @transitionTo 'game.round', game, game.get('currentRound')
      else
        @transitionTo 'games.new'

