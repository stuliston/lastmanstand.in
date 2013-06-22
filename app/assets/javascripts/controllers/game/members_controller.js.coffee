LMS.GameMembersController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.gameMemberships'