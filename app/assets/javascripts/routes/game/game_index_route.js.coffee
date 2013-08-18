LMS.GameIndexRoute = Ember.Route.extend LMS.CurrentRoundForGame,

  model: ->
    @modelFor('game')

  afterModel: (game, transition) ->
    @transitionTo('game.round', game.get('currentRound'))