LMS.GamesNewRoute = Ember.Route.extend

  model: ->
    LMS.Game.createRecord()

  setupController: (controller, game) ->
    window.game = game
    controller.set('model', game)
    controller.set('leagues', LMS.League.find())