LMS.GameInvitationsNotificationController = Ember.ArrayController.extend

  needs: ['currentProfile']
  modelBinding: 'controllers.currentProfile.gameInvitations'

  hasInvitations: (->
    @get('length') > 0
  ).property('@each')
