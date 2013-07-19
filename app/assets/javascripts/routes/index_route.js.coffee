LMS.IndexRoute = Ember.Route.extend

  afterModel: ->
    game = @modelFor('application').get('currentProfile.gameMemberships.firstObject.game')
    # if game
    #   @transitionTo 'game.current_round', game  