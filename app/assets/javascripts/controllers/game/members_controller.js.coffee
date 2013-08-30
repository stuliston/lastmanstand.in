LMS.GameMembersController = Ember.ArrayController.extend

  itemController: 'game_membership_item'

  membersWithLives: (->
    @_sortedMemberships(@filter((membership) -> !membership.get('isOutOfLives')), 'lostLives')
  ).property('@each.lostLives')

  membersWithoutLives: (->
    @_sortedMemberships(@filter((membership) -> membership.get('isOutOfLives')), 'knockoutFixture.round.number', false)
  ).property('@each.lostLives')

  _sortedMemberships: (memberships, sortBy, sortAscending = true) ->
    Ember.ArrayController.createWithMixins(content: memberships, sortProperties: [sortBy], sortAscending: sortAscending)