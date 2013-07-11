LMS.GameIndexRoute = Ember.Route.extend

  model: ->
    @modelFor('game')

  afterModel: (game, transition) ->
    @transitionTo('game.current_round', game)  