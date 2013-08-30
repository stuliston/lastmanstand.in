LMS.NavGameMembershipsController = Ember.ArrayController.extend

  currentGames: ( ->
    @_sortedGames(@filter((membership) -> !membership.get('isOutOfLives')).mapProperty('game'))
  ).property('@each.isOutOfLives')

  pastGames: ( ->
    @_sortedGames(@filter((membership) -> membership.get('isOutOfLives')).mapProperty('game'))
  ).property('@each.isOutOfLives')

  _sortedGames: (games) ->
    Ember.ArrayController.createWithMixins(content: games, sortProperties: ['name'])