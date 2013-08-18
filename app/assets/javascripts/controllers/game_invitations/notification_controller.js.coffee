LMS.GameInvitationsNotificationController = Ember.ArrayController.extend

  needs: ['currentUser']
  modelBinding: 'controllers.currentUser.gameInvitations'

  hasInvitations: (->
    @get('length') > 0
  ).property('@each')
