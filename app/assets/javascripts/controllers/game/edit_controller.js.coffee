LMS.GameEditController = Ember.ObjectController.extend

  needs: ['currentUser', 'featureToggles']

  isInvalid: (->
    !@get('gameInvitations').someProperty('isNew')
  ).property('gameInvitations.@each.isNew')

  unsavedGameInvitations: (->
    @get('model.gameInvitations').filter (invitation) -> !invitation.get('id')
  ).property('gameInvitations.@each.id')

  actions:
    sendInvitations: ->
      game = @get('model')
      @get('store').commit()
      @scheduleRouteWhenAllSaved(game)

    cancel: ->
      @get('store').defaultTransaction.rollback()
      @transitionToRoute('game.members', @get('model'))

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (game) ->
    invitations = Ember.A()
    invitations.addObjects(game.get('gameInvitations'))
    invitations.addObserver '@each.id', =>
      unless invitations.some((invitation) -> !invitation.get('id'))
        Ember.run.next =>
          @_resolveHasManyArray(game.get('gameInvitations'))
          @transitionToRoute('game.members', game)

  #This is to get around a bug in ember data that means hasMany arrays are not being
  #marked as loaded so their promise is never resolved. When this happens, routes that
  #load the hasMany relationship will never transition because they are waiting on the
  #promise to resolve
  _resolveHasManyArray: (invitations) ->
    invitations.set('isLoaded', true)
    invitations.resolve(invitations)

