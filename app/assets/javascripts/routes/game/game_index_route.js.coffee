#= require ../authenticated_route
LMS.GameIndexRoute = LMS.AuthenticatedRoute.extend

  model: ->
    @modelFor('game')

  afterModel: (game, transition) ->
    @transitionTo('game.round', game.get('currentRound'))