LMS.GamesNewRoute = Ember.Route.extend

  model: ->
    LMS.Game.createRecord()

  setupController: (controller, game) ->
    controller.set('model', game)
    LMS.Competition.find().then (competitions) =>
      controller.set('seasons', competitions.mapProperty('currentSeason'))
