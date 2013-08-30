LMS.GameInvitationsNotificationController = Ember.ArrayController.extend

  needs: ['currentUser']

  hasInvitations: (->
    @get('length') > 0
  ).property('@each')
