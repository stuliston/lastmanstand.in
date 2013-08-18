LMS.GameIndexRoute = Ember.Route.extend

  model: ->
    @modelFor('game')

  afterModel: (game, transition) ->
    @transitionTo('game.round', game.get('currentRound'))