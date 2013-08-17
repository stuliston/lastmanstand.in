LMS.GameMembersController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.gameMemberships'
  itemController: 'game_membership_item'

  membersWithLives: (->
    @_sortedMemberships(@filter((membership) -> !membership.get('isOutOfLives')))
  ).property('@each.lostLives')

  membersWithoutLives: (->
    @_sortedMemberships(@filter((membership) -> membership.get('isOutOfLives')))
  ).property('@each.lostLives')

  _sortedMemberships: (memberships) ->
    Ember.ArrayController.createWithMixins(content: memberships, sortProperties: ['lostLives'])