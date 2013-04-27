LMS.GamesRoute = Ember.Route.extend

  model: ->
    LMS.Game.find()

  setupController: (controller, games) ->
    controller.set('model', games)