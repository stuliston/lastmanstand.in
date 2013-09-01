#= require ../authenticated_route
LMS.GameRoute = LMS.AuthenticatedRoute.extend

  gameRefreshed: false

  beforeModel: ->
    @_super()
    @controllerFor('application').hideNavigation()

  model: (params) ->
    LMS.Game.find(params.game_id)

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
