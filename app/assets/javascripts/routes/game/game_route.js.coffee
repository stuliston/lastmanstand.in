LMS.GameRoute = Ember.Route.extend

  # afterModel: (game) ->
  #   if game.get('isLoaded')
  #     game.reload()

  model: (params) ->
    LMS.Game.find(params.game_id)
