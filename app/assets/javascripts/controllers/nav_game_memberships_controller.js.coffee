LMS.NavGameMembershipsController = Ember.ArrayController.extend

  needs: ['currentUser']
  modelBinding: 'controllers.currentUser.gameMemberships'
  itemController: 'game_membership_item'

  currentGames: ( ->
    @_sortedGames(@filter((membership) -> !membership.get('isOutOfLives')).mapProperty('game'))
  ).property('@each.isOutOfLives')

  pastGames: ( ->
    @_sortedGames(@filter((membership) -> membership.get('isOutOfLives')).mapProperty('game'))
  ).property('@each.isOutOfLives')

  _sortedGames: (games) ->
    Ember.ArrayController.createWithMixins(content: games, sortProperties: ['name'])