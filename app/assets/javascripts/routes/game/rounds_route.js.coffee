#= require ../authenticated_route
LMS.GameRoundsRoute = LMS.AuthenticatedRoute.extend

  model: ->
    @modelFor('game').get('season.rounds')

  setupController: (controller, rounds) ->
    controller.set('model', rounds)
    @controllerFor('application').set('pageTitle', @modelFor('game').get('name'))
