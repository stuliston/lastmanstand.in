LMS.GameRoute = Ember.Route.extend

  gameRefreshed: false

  beforeModel: ->
    @controllerFor('application').hideNavigation()

  afterModel: (game) ->
    if game.get('isLoaded') && !@get('gameRefreshed')
      @set('gameRefreshed', true)
      game.reload()

  events:
    willTransition: (transition) ->
      unless transition.targetName.match(/^game\./)
        @set('gameRefreshed', false)

  model: (params) ->
    LMS.Game.find(params.game_id)

  setupController: (controller, game) ->
    controller.set('model', game)
