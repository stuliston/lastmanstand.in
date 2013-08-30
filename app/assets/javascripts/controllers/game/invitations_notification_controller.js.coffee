LMS.GameInvitationsNotificationController = Ember.ArrayController.extend

  needs: ['currentUser']
  # model: Ember.computed.alias('controllers.currentUser.gameInvitations')

  hasInvitations: (->
    @get('length') > 0
  ).property('@each')
