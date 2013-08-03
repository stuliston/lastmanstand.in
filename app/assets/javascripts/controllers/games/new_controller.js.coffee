LMS.GamesNewController = Ember.ObjectController.extend

  needs: ['currentProfile', 'featureToggles']
  competition: null

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

  saveGame: ->
    currentProfile = @get('controllers.currentProfile.model')
    game = @get('model')
    game.get('gameMemberships').pushObject(LMS.GameMembership.createRecord(game: game, profile: currentProfile))

    @get('store').commit()
    @scheduleRouteWhenAllSaved(game)
    @set('isSavingGame', true)

  # When all models have returned with ids, perform route.
  # Once some extra work is done in ember data and commit returns a promise we won't need this.
  scheduleRouteWhenAllSaved: (game) ->
    models = [game]
    models.addObjects(game.get('gameMemberships'))
    models.addObjects(game.get('gameInvitations'))

    models.addObserver '@each.isNew', =>
      @transitionToRoute('game.current_round', game) unless models.some((model) -> !model.get('id'))

  cancel: ->
    @transitionToRoute(@get('indexRoute'))