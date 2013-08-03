LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    currentProfile = @modelFor('application').get('currentProfile')

    game = @controllerFor('game').lastGame() || currentProfile.get('gameMemberships.firstObject.game')
    if game
      @transitionTo 'game.current_round', game
    else if currentProfile.get('gameInvitations.firstObject')
      @transitionTo 'game_invitations'
    else
      @transitionTo 'games.new'