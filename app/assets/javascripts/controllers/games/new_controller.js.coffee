LMS.GamesNewController = Ember.ObjectController.extend

  needs: ['currentUser', 'featureToggles']
  competitions: null
  currentUser: Ember.computed.alias('controllers.currentUser.model')
  featureToggles: Ember.computed.alias('controllers.featureToggles')

  totalPlayers: (->
    @get('gameInvitations.length') + @get('gameMemberships.length')
  ).property('gameInvitations.length', 'gameMemberships.length')

  totalPlayersRemaining: (->
    @get('maxAllowedPlayers') - @get('totalPlayers')
  ).property('maxAllowedPlayers', 'totalPlayers')

  morePlayersAllowed: ( ->
    @get('totalPlayersRemaining') > 0
  ).property('totalPlayersRemaining')

  isInvalid: (->
    !(@get('season') && @get('name'))
  ).property('season', 'name')

  seasons: (->
    @get('competitions').mapProperty('currentSeason')
  ).property('competitions.@each')

  unsavedGameInvitations: (->
    @get('gameInvitations').filter (invitation) -> !invitation.get('id')
  ).property('gameInvitations.@each.id')


  actions:
    saveGame: ->
      currentUser = @get('currentUser')
      game = @get('model')
      game.get('gameMemberships').pushObject(LMS.GameMembership.createRecord(game: game, user: currentUser))

      @get('store').commit()
      @scheduleRouteWhenAllSaved(game)
      @set('isSavingGame', true)

    cancel: ->
      @transitionToRoute(@get('indexRoute'))

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (game) ->
    models = Ember.A([game])
    memberships = game.get('gameMemberships')
    invitations = game.get('gameInvitations')
    models.addObjects(memberships)
    models.addObjects(invitations)

    models.addObserver '@each.id', =>
      unless models.some((model) -> !model.get('id'))
        #run next run loop in case has many arrays need to do other things first
        Ember.run.next =>
          @_resolveHasManyArrays(memberships, invitations)
          @transitionToRoute('game.rounds', game)

  #This is to get around a bug in ember data that means hasMany arrays are not being
  #marked as loaded so their promise is never resolved. When this happens, routes that
  #load the hasMany relationship will never transition because they are waiting on the
  #promise to resolve
  _resolveHasManyArrays: (memberships, invitations) ->
    memberships.set('isLoaded', true)
    memberships.resolve(memberships)
    invitations.set('isLoaded', true)
    invitations.resolve(invitations)
