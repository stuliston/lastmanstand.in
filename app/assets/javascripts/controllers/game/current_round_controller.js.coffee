LMS.GameCurrentRoundController = Ember.ObjectController.extend

  needs: ['game']
  modelBinding: 'controllers.game.season.rounds.firstObject' #for now