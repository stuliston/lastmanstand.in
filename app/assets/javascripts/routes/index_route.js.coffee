LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    currentProfile = @modelFor('application').get('currentProfile')

    alert currentProfile.get('gameMemberships.firstObject.game')

    if currentProfile.get('gameInvitations.length')
      @transitionTo 'game_invitations'
    else if game = @controllerFor('game').lastGame() || currentProfile.get('gameMemberships.firstObject.game')
      @transitionTo 'game.round', game, game.get('currentRound')
    else
      @transitionTo 'games.new'


