LMS.GameInvitationsController = Ember.ArrayController.extend

  needs: ['currentUser']
  modelBinding: 'controllers.currentUser.gameInvitations'

  areAnyInvitationsToAction: (->
    @some (invitation) -> invitation.get('isActioned') != true
  ).property('@each.isActioned')

  isSingleInvitation: (->
    @get('length') == 1
  ).property('@each')

  accept: (invitation) ->
    game = invitation.get('game')
    gameMemberships = @get('controllers.currentUser.gameMemberships')
    gameMemberships.createRecord(game: game)
    invitation.set('isActioned', true)
    @get('store').commit()

    @transitionToRoute('game.round', game.get('currentRound')) unless @get('areAnyInvitationsToAction')

  dismissConfirm: (invitation) ->
    invitation.set('isConfirmingDismiss', true)

  dismiss: (invitation) ->
    invitation.set('isActioned', true)
    invitation.deleteRecord()
    @get('store').commit()
    @transitionToRoute('index') unless @get('areAnyInvitationsToAction')

  dismissCancel: (invitation) ->
    invitation.set('isConfirmingDismiss', false)