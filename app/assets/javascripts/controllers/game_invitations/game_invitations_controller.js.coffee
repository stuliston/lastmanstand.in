LMS.GameInvitationsController = Ember.ArrayController.extend

  needs: ['currentProfile']
  modelBinding: 'controllers.currentProfile.gameInvitations'

  accept: (invitation) ->
    gameMemberships = @get('controllers.currentProfile.gameMemberships')
    gameMemberships.createRecord(game: invitation.get('game'))
    invitation.set('isActioned', true)
    @get('store').commit()