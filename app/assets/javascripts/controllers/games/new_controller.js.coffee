LMS.GamesNewController = Ember.ObjectController.extend

  needs: ['currentProfile']
  league: null

  totalPlayers: (->
    @get('gameInvitations.length') + @get('gameMemberships.length')
  ).property('gameInvitations.length', 'gameMemberships.length')

  totalPlayersRemaining: (->
    @get('maxAllowedPlayers') - @get('totalPlayers')
  ).property('maxAllowedPlayers', 'totalPlayers')

  morePlayersAllowed: ( ->
    @get('totalPlayersRemaining') > 0
  ).property('totalPlayersRemaining')

  leagueDidChange: (->
    console.log 'setting season', @get('league.currentSeason')
    @set('season', @get('league.currentSeason'))
  ).observes('league')

  saveGame: ->
    currentProfile = @get('controllers.currentProfile.model')
    game = @get('model')
    game.get('gameMemberships').pushObject(LMS.GameMembership.createRecord(game: game, profile: currentProfile))
    debugger
    @get('store').commit()
    # @transitionToRoute(@get('indexRoute'))

  cancel: ->
    @transitionToRoute(@get('indexRoute'))