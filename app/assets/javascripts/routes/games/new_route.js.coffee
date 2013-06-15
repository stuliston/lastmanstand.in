LMS.GamesNewRoute = Ember.Route.extend

  model: ->
    game = LMS.Game.createRecord()
    currentProfile = @controllerFor('currentProfile').get('model')
    game.get('gameMemberships').pushObject(LMS.GameMembership.createRecord(game: game, profile: currentProfile))
    game

  setupController: (controller, game) ->
    window.game = game
    controller.set('model', game)
    controller.set('leagues', LMS.League.find())