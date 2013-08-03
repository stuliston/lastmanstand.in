LMS.GamePendingInvitationsController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.gameInvitations'
