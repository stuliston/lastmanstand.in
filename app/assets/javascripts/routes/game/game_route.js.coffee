#= require ../authenticated_route
LMS.GameRoute = LMS.AuthenticatedRoute.extend

  beforeModel: ->
    @controllerFor('application').hideNavigation()
    @_super()

  model: (params) ->
    success = (game) -> game
    error = (error) -> Ember.RSVP.reject(status: 404)
    LMS.Game.find(params.game_id).then(success, error)

  afterModel: (game) ->
    lastGame = @get('lastGame')
    @set('lastGame', game)
    if game.get('isLoaded') && lastGame && lastGame != game
      game.reload() #last to return promise for router loading behaviour

  setupController: (controller, game) ->
    controller.set('model', game)
    @controllerFor('gamePredictions').set('model', game.get('predictions'))
    @controllerFor('application').set('pageTitle', game.get('name'))

