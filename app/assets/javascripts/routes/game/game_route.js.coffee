LMS.GameRoute = Ember.Route.extend
  
  gameRefreshed: false

  afterModel: (game) ->
    if game.get('isLoaded') && !@get('gameRefreshed')
      game.reload()
      @set('gameRefreshed', true)

  events:
    willTransition: (transition) ->
      unless transition.targetName.match(/^game\./)
        @set('gameRefreshed', false) 
        
  model: (params) ->
    LMS.Game.find(params.game_id)
