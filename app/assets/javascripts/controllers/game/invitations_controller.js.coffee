LMS.GameInvitationsController = Ember.ArrayController.extend

  needs: ['currentUser']

  areAnyInvitationsToAction: (->
    @some (invitation) -> invitation.get('isActioned') != true
  ).property('@each.isActioned')

  isSingleInvitation: (->
    @get('length') == 1
  ).property('@each')

  actions:
    accept: (invitation) ->
      game = invitation.get('game')
      gameMemberships = @get('controllers.currentUser.gameMemberships')
      gameMembership = gameMemberships.createRecord(game: game)
      invitation.set('isActioned', true)
      @get('store').commit()
      @scheduleRouteWhenAllSaved(gameMembership) unless @get('areAnyInvitationsToAction')

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
    gameMembership.addObserver 'id', =>
      game = gameMembership.get('game')
      @transitionToRoute('game.round', game, game.get('currentRound'))
