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
    gameMembership = gameMemberships.createRecord(game: game)
    invitation.set('isActioned', true)
    @get('store').commit()
    @scheduleRouteWhenAllSaved(gameMembership)

  dismissConfirm: (invitation) ->
    invitation.set('isConfirmingDismiss', true)

  dismiss: (invitation) ->
    invitation.set('isActioned', true)
    invitation.deleteRecord()
    @get('store').commit()
    @transitionToRoute('index') unless @get('areAnyInvitationsToAction')

  dismissCancel: (invitation) ->
    invitation.set('isConfirmingDismiss', false)

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (gameMembership) ->
    gameMembership.addObserver 'isNew', =>
      game = gameMembership.get('game')
      @transitionToRoute('game.round', game, game.get('currentRound'))
