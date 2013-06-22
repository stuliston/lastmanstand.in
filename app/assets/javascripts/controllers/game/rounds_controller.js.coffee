LMS.GameRoundsController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.season.rounds'