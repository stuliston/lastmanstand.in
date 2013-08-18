LMS.NavGameMembershipsController = Ember.ArrayController.extend

  needs: ['currentProfile']
  modelBinding: 'controllers.currentProfile.gameMemberships'
  itemController: 'game_membership_item'

  currentGames: ( ->
    @_sortedGames(@filter((membership) -> !membership.get('isOutOfLives')))#.mapProperty('game'))
  ).property('@each.isOutOfLives')

  pastGames: ( ->
    @_sortedGames(@filter((membership) -> membership.get('isOutOfLives')))#.mapProperty('game'))
  ).property('@each.isOutOfLives')

  _sortedGames: (games) ->
    Ember.ArrayController.createWithMixins(content: games, sortProperties: ['game.name'])