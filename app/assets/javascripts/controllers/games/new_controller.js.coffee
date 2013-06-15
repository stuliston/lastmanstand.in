LMS.GamesNewController = Ember.ObjectController.extend

  morePlayersAllowed: ( ->
    @get('gameInvitations.length') < @get('maxAllowedPlayers')
  ).property('gameInvitations.length')

  saveGame: ->
    @get('store').commit()
    # @transitionToRoute(@get('indexRoute'))