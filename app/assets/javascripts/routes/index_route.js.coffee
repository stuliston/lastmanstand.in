LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    currentProfile = @modelFor('application').get('currentProfile')

    if currentProfile.get('gameInvitations.length')
      @transitionTo 'game_invitations'
    else if game = @controllerFor('game').lastGame() || currentProfile.get('gameMemberships.firstObject.game')
      @transitionTo 'game.current_round', game
    else
      @transitionTo 'games.new'