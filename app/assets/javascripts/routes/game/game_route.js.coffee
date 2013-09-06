#= require ../authenticated_route
LMS.GameRoute = LMS.AuthenticatedRoute.extend

  gameRefreshed: false

  beforeModel: ->
    @controllerFor('application').hideNavigation()
    @_super()

  model: (params) ->
    success = (game) -> game
    error = (error) -> Ember.RSVP.reject(status: 404)
    LMS.Game.find(params.game_id).then(success, error)

  afterModel: (game) ->
    if game.get('isLoaded') && (!@get('gameRefreshed') || @get('lastGame') != game)
      @set('gameRefreshed', true)
      @set('lastGame', game)
      game.reload() #last to return promise for router loading behaviour

  setupController: (controller, game) ->
    controller.set('model', game)
    @controllerFor('gamePredictions').set('model', game.get('predictions'))
    @controllerFor('application').set('pageTitle', game.get('name'))


  actions:
    willTransition: (transition) ->
      if !transition.targetName.match(/^game\./)
        @set('gameRefreshed', false)
