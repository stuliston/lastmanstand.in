LMS.IndexRoute = Ember.Route.extend LMS.CurrentRoundForGame,

  afterModel: ->
    currentProfile = @modelFor('application').get('currentProfile')

    if currentProfile.get('gameInvitations.length')
      @transitionTo 'game_invitations'
    else if game = @controllerFor('game').lastGame() || currentProfile.get('gameMemberships.firstObject.game')
      @transitionTo 'game.round', game, game.get('currentRound')
    else
      @transitionTo 'games.new'


