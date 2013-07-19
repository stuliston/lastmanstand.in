LMS.GamesNewController = Ember.ObjectController.extend

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
    @set('season', @get('league.currentSeason'))
  ).observes('league')

  saveGame: ->
    @get('store').commit()
    # @transitionToRoute(@get('indexRoute'))

  cancel: ->
    @transitionToRoute(@get('indexRoute'))  