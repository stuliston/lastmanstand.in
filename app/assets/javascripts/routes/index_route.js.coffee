LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    game = @controllerFor('game').lastGame() || @modelFor('application').get('currentProfile.gameMemberships.firstObject.game')
    if game
      @transitionTo 'game.current_round', game  