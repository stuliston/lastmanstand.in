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
    #We don't want to release it doing this - waiting on pull request https://github.com/emberjs/data/pull/724
    @get('store').commit() unless @get('id') || !@get('league')
    console.log @get('model.stateManager.currentPath')
  ).observes('league')


  saveGame: ->
    console.log @get('model.stateManager.currentPath')
    @get('store').commit()
    # @transitionToRoute(@get('indexRoute'))