LMS.GameRoute = Ember.Route.extend

  gameRefreshed: false

  beforeModel: ->
    @controllerFor('application').hideNavigation()

  afterModel: (game) ->

    if game.get('isLoaded') && (!@get('gameRefreshed') || @get('lastGame') != game)
      @set('gameRefreshed', true)
      @set('lastGame', game)
      game.reload() #last to return promise for router loading behaviour

  events:
    willTransition: (transition) ->
      if !transition.targetName.match(/^game\./)
        @set('gameRefreshed', false)

  model: (params) ->
    LMS.Game.find(params.game_id)

  setupController: (controller, game) ->
    controller.set('model', game)
