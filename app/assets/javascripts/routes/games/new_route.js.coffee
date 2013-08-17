LMS.GamesNewRoute = Ember.Route.extend

  model: ->
    LMS.Game.createRecord()

  setupController: (controller, game) ->
    controller.set('model', game)
    controller.set('competitions', LMS.Competition.find())
    @controllerFor('application').set('pageTitle', "Start a New Game")