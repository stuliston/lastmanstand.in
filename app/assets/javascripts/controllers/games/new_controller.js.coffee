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

  saveGame: ->
    currentUser = @get('currentUser')
    game = @get('model')
    game.get('gameMemberships').pushObject(LMS.GameMembership.createRecord(game: game, user: currentUser))

    @get('store').commit()
    @scheduleRouteWhenAllSaved(game)
    @set('isSavingGame', true)

  unsavedGameInvitations: (->
    @get('gameInvitations').filter (invitation) -> !invitation.get('id')
  ).property('gameInvitations.@each.id')

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (game) ->
    models = Ember.A([game])
    models.addObjects(game.get('gameMemberships'))
    models.addObjects(game.get('gameInvitations'))

    models.addObserver '@each.isNew', =>
      @transitionToRoute('game.round', game, game.get('currentRound')) unless models.some((model) -> !model.get('id'))

  cancel: ->
    @transitionToRoute(@get('indexRoute'))