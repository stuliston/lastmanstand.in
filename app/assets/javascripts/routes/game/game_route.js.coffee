LMS.GameRoute = Ember.Route.extend

  model: (params) ->
    LMS.Game.find(params.game_id)

  # setupController: (controller, game) ->
  #   controller.set('model', game)
