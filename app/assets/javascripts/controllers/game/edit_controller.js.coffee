LMS.GameEditController = Ember.ObjectController.extend

  needs: ['currentUser', 'featureToggles']

  sendInvitations: ->
    game = @get('model')
    @get('store').commit()
    @scheduleRouteWhenAllSaved(game)

  isInvalid: (->
    !@get('gameInvitations').someProperty('isNew')
  ).property('gameInvitations.@each.isNew')

  unsavedGameInvitations: (->
    @get('model.gameInvitations').filter (invitation) -> !invitation.get('id')
  ).property('gameInvitations.@each.id')

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (game) ->
    invitations = Ember.A()
    invitations.addObjects(game.get('gameInvitations'))
    invitations.addObserver '@each.id', =>
      unless invitations.some((invitation) -> !invitation.get('id'))
        @transitionToRoute('game.members', game)

  cancel: ->
    @get('store').defaultTransaction.rollback()
    @transitionToRoute('game.members', @get('model'))